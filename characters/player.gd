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

var selected : String = "trial"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SELECTED_CLASS  = load("res://resources/jobs/%s.tres" % selected)
	if SELECTED_CLASS: 
		var player = SELECTED_CLASS.animationComponent.instantiate()
		var weapon = SELECTED_CLASS.weapon.weaponAnimations.instantiate()
		add_child(player)
		add_child(weapon)
		weapon.position = Vector2(0,-9)
		weapon.get_node("AnimationPlayer").speed_scale = SELECTED_CLASS.weapon.attackSpeed
	
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
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
	
