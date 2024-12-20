extends CanvasLayer

const OPTIONS = preload("res://scenes/UI/options.tscn")
const PLAYER_PROFILE = preload("res://ui/Player_profile.tscn")


func _on_settings_pressed() -> void:
	visible = false
	var options_menu = OPTIONS.instantiate()
	add_child(options_menu)

func _on_profile_pressed() -> void:
	visible = false
	var profile = PLAYER_PROFILE.instantiate()
	add_child(profile)
