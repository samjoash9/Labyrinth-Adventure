extends CanvasLayer

func _on_exit_pressed() -> void:
	get_parent().visible = true
	queue_free()
