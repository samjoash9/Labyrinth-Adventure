extends CanvasLayer
signal loaded

func _on_exit_button_pressed() -> void:
	get_tree().quit()
	await get_tree().process_frame
	emit_signal("loaded")
