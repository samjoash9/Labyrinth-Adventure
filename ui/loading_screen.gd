extends CanvasLayer

func _on_maze_generator_map_loaded() -> void:
	SceneManager.fade_in()
	queue_free()
