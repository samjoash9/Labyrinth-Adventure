extends Node2D

class_name central_hub

@onready var initial_camera_limiter = $CameraLimiters/camera_limiter_leftBottom
@onready var camera2 = $CameraLimiters/camera_limiter_rightBottom
@onready var player: Player = $Player

func _ready() -> void:
	player.camera.camera_limit_manager.set_limiter(initial_camera_limiter, false)
	player.camera.camera_limit_manager.set_limiter(camera2, false)
