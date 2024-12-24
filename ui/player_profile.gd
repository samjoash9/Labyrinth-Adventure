extends CanvasLayer

@onready var click_sound: AudioStreamPlayer2D = $click_sound

func _on_exit_pressed() -> void:
	click_sound.play()
	get_parent().visible = true
	queue_free()
