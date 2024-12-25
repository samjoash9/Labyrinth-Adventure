extends CanvasLayer

@onready var click_sound: AudioStreamPlayer2D = $click_sound

func _on_quit_pressed() -> void:
	click_sound.play()
	get_parent().get_node("click_sound").play()
	get_tree().quit()

func _on_cancel_pressed() -> void:
	click_sound.play()
	get_parent().visible = true
	queue_free()
