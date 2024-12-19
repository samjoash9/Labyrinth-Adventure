extends WeaponClass
@onready var marker_2d: Marker2D = $Marker2D
const MAGIC_BULLET = preload("res://weapons/magic_bullet.tscn")

func useAttack():
	var bullet = MAGIC_BULLET.instantiate()
	bullet.global_rotation = marker_2d.global_rotation
	bullet.global_position = marker_2d.global_position
	add_child(bullet)
	

	
