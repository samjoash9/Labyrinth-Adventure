extends Node2D
class_name WeaponClass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	rotation_degrees = wrap(rotation_degrees, 0 , 360)
	
	if rotation_degrees > 90 and rotation_degrees < 270: 
		scale.y = -1
		#z_index = -1
	else :
		scale.y = 1
		#z_index = 1
	
	if Input.is_action_just_pressed("click"):
		useAttack()
	
func useAttack():
	pass
