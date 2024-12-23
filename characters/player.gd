extends CharacterBody2D
class_name playerCharacter

enum {
	IDLE,
	MOVING,
	DEAD,
	HURT
}

var state = IDLE

var SELECTED_CLASS : CharacterResource
var player: Node2D
var weapon: Node2D
@export var selected : String = GameManager.selected_hero	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SELECTED_CLASS  = load("res://resources/jobs/%s.tres" % selected)
	if SELECTED_CLASS: 
		instantiate_player()
		#weapon.get_node("AnimationPlayer").speed_scale = SELECTED_CLASS.weapon.attackSpeed
	scale.x = 0.5
	scale.y = 0.5
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func instantiate_player():
	player = SELECTED_CLASS.animationComponent.instantiate()
	weapon = SELECTED_CLASS.weapon.weaponAnimations.instantiate()
	add_child(player)
	weapon.position = Vector2(0,-9)

func reselect_character():
	player.queue_free()
	#weapon.queue_free()
	SELECTED_CLASS = load("res://resources/jobs/%s.tres" % GameManager.selected_hero)
	instantiate_player()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("e"):
		reselect_character()
	if SELECTED_CLASS:
		if SELECTED_CLASS.basicStats.Hitpoints > 0:
				var inputDir = Input.get_vector("left", "right", "up", "down").normalized()
				velocity = inputDir * SELECTED_CLASS.basicStats.Movespeed * 100 * delta
				velocity.normalized()
				if velocity: 
					state = MOVING
				else:
					state = IDLE
				move_and_slide()
		else : 
			state = DEAD

func setCurrentClass():
	pass
	
