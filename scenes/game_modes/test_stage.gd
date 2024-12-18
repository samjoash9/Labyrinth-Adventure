extends Node2D

@onready var sword_animations: Node2D = $SwordAnimations

func _process(delta: float) -> void:
	sword_animations.look_at((get_global_mouse_position() - sword_animations.global_position.normalized()))
	
