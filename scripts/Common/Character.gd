extends CharacterBody2D
class_name Character

var Speed = 400
var mouseDir

enum {
	IDLE,
	MOVING,
	HURT,
	DEAD,
	ATTACKING
}

var state = IDLE

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("useUnique"):
		useUniqueSkill()
	manageStates()
	mouseDir = (get_global_mouse_position() - global_position).normalized()
	var inputDir = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = inputDir * Speed * 100 * delta
	velocity.normalized()
	
	
	updateWeaponPosition()
	updateAnimation()
	move_and_slide()

func updateAnimation():
	pass

func updateWeaponPosition():
	pass

func useUniqueSkill():
	pass
	
func manageStates():
	pass
