extends WeaponClass
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var marker_2d: Marker2D = $Marker2D

const SLASH_WAVE = preload("res://weapons/slash_wave.tscn")

func slash():
	var slashInstance = SLASH_WAVE.instantiate()
	slashInstance.global_position = marker_2d.global_position
	slashInstance.global_rotation = marker_2d.global_rotation
	if rotation_degrees > 90 and rotation_degrees < 270: 
		slashInstance.scale.y = -2.5
	else :
		slashInstance.scale.y = 2.5
	add_child(slashInstance) 
