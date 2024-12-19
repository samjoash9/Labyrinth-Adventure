extends Node2D

class_name central_hub

@onready var initial_camera_limiter = $CameraLimiters/camera_limiter_leftBottom
@onready var camera2 = $CameraLimiters/camera_limiter_rightBottom
@onready var player: playerCharacter = $Player

func _ready() -> void:
	pass
