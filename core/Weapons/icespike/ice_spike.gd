extends Node2D
class_name SingleShotNode

func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
