extends CanvasLayer

func _on_maze_generator_map_loaded() -> void:
	await get_tree().create_timer(1).timeout
	queue_free()
