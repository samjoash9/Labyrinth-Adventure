extends CharacterBody2D
class_name Character

var Speed = 400
var mouseDir

func _process(delta: float) -> void:

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
