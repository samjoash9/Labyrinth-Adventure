extends WeaponClass
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var marker_2d: Marker2D = $Marker2D

const SLASH_WAVE = preload("res://weapons/slash_wave.tscn")
func useAttack():
	animation_player.play("Attack")

func slash():
	var slash = SLASH_WAVE.instantiate()
	slash.global_position = marker_2d.global_position
	slash.global_rotation = marker_2d.global_rotation
	if rotation_degrees > 90 and rotation_degrees < 270: 
		slash.scale.y = -2.5
	else :
		slash.scale.y = 2.5
	add_child(slash) 
