extends CanvasLayer

const OPTIONS = preload("res://scenes/UI/options.tscn")
const PLAYER_PROFILE = preload("res://ui/Player_profile.tscn")
@onready var player: Player = $"../Player"

@onready var click_sound: AudioStreamPlayer2D = $click_sound

func _on_settings_pressed() -> void:
	player.set_process(false)
	click_sound.play()
	visible = false
	var options_menu = OPTIONS.instantiate()
	add_child(options_menu)

func _on_profile_pressed() -> void:
	player.set_process(false)
	click_sound.play()
	visible = false
	var profile = PLAYER_PROFILE.instantiate()
	add_child(profile)

func _on_exit_pressed() -> void:
	click_sound.play()
	SceneManager.change_scene(
	"res://ui/game_start.tscn",
  { "pattern": "scribbles", "pattern_leave": "scribbles"})
