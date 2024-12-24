extends CanvasLayer

func _on_maze_generator_map_loaded() -> void:
<<<<<<< Updated upstream
	await get_tree().create_timer(1).timeout
=======
	await get_tree().create_timer(2).timeout
	SceneManager.fade_in()
>>>>>>> Stashed changes
	queue_free()
