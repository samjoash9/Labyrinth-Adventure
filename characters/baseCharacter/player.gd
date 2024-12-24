extends CharacterBody2D
class_name Player

# Set Player Stats and Define setters and getters

enum states{
	IDLE,
	MOVE,
	HURT,
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

var movementSpeed: float

var might: float

var armor: float

var magnetArea: float:
	set(value):
		magnetArea = value

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
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	exp = 0
	expCap = 10
	character = load("res://resources/jobs/" + GameManager.selected_hero + ".tres")
	scale.x = 0.5
	scale.y = 0.5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var inputDir = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = inputDir * movementSpeed
	velocity.normalized()
	move_and_slide()

func reselect_character():
	match GameManager.selected_hero:
		"rogue":
			if has_node("KnightAnimations"):
				get_node("KnightAnimations").queue_free()
			if has_node("WizardAnimations"):
				get_node("WizardAnimations").queue_free()
		"knight":
			if has_node("RougeAnimations"):
				get_node("RougeAnimations").queue_free()
			if has_node("WizardAnimations"):
				get_node("WizardAnimations").queue_free()
		"wizard":
			if has_node("KnightAnimations"):
				get_node("KnightAnimations").queue_free()
			if has_node("RougeAnimations"):
				get_node("RougeAnimations").queue_free()
	
	character = load("res://resources/jobs/%s.tres" % GameManager.selected_hero)
