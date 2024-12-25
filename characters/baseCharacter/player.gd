extends CharacterBody2D
class_name Player

# Set Player Stats and Define setters and getters

enum states{
	IDLE,
	MOVE,
	DEAD,
}


const expGrowthRate: float = 0.2
@onready var state = states.IDLE

var maxHitpoints: float :
	set(value):
		maxHitpoints = value
		%HpBar.max_value = maxHitpoints
		
var hitPoints: float :
	set(value):
		hitPoints = clamp(value, 0 ,maxHitpoints)
		var tween:=create_tween()
		tween.tween_property(%HpBar,"value", value, 0.5)
		if hitPoints == 0:
			self.set_process(false)
			$PlayerBodyCollision.set_deferred("disabled", true)
			state = states.DEAD

var movementSpeed: float

var might: float

var armor: float

var magnetArea: float:
	set(value):
		magnetArea = value
		$Item_Magnet/MagnetArea.shape.radius = magnetArea

var areaMultiplier: float:
	set(value):
		areaMultiplier = value

var growth : float

var level: float = 1:
	set(value):
		expCap += expCap * (expGrowthRate*(value-level))
		level = value
		%Level.text = str(level)
		%Options.show_option()
		
var exp: float:
	set(value):
		if value * growth > %XpBar.max_value:
			level+= floor(value * growth/%XpBar.max_value)
			exp = value/%XpBar.max_value
		else:
			exp = value * growth
		var tween:=create_tween()
		tween.tween_property(%XpBar,"value", exp, 0.5)

var expCap: float:
	set(value):
		expCap = value
		%XpBar.max_value = expCap

var character : CharacterResource:
	set(value):
		character = value
		%Portrait.texture = character.characterPortrait
		maxHitpoints = character.basicStats.maxHitpoints
		hitPoints = character.basicStats.hitPoints
		movementSpeed = character.basicStats.moveSpeed
		might = character.basicStats.might
		armor = character.basicStats.armor
		magnetArea = character.basicStats.magnetArea
		areaMultiplier = character.basicStats.areaMultiplier
		growth = character.basicStats.growth
		add_child(character.animationComponent.instantiate())

var animations : Animations
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	exp = 0
	expCap = 10
	character = load("res://resources/jobs/rouge.tres")
	
	for child in get_children():
		if child is Animations:
			animations = child


var nearest_enemy : CharacterBody2D
var nearest_enemy_distance : float = INF

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("DevDebug"):
		$DebugUI.visible = !$DebugUI.visible
	if Input.is_action_just_pressed("debugkill"):
		debug_killAllEnemy()
	if Input.is_action_just_pressed("DebugLevelUp"):
		level+=1
	
	if nearest_enemy != null:
		nearest_enemy_distance = nearest_enemy.separation
	else:
		nearest_enemy_distance = INF
		
	var inputDir = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = inputDir * movementSpeed
	velocity.normalized()
	if velocity:
		$GPUParticles2D.emitting = true
	else:
		$GPUParticles2D.emitting = false
	move_and_slide()

func take_damage(damage):
	hitPoints -= damage-(damage*armor)
	var tween = create_tween()
	tween.tween_property(animations, "modulate", Color(1,0,0) , 0.1)
	tween.tween_property(animations, "modulate", Color(1,1,1) , 0.1)


func debug_killAllEnemy():
	for i in get_tree().get_nodes_in_group("enemy"):
		i.hitPoints = 0
	await get_tree().create_timer(1).timeout
	for i in get_tree().get_nodes_in_group("loot"):
		i.magnet_stregth = 10
		i.set_process(true)
