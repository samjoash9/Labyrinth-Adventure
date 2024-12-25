extends AnimatedSprite2D

func _on_maze_generator_last_index(portal_position: Vector2i) -> void:
	position = portal_position
