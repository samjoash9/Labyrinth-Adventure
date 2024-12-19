extends CanvasLayer


func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_cancel_pressed() -> void:
	get_parent().visible = true
	queue_free()
