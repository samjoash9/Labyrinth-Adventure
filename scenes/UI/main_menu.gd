extends Control
signal loaded

const OPTIONS = preload("res://scenes/UI/options.tscn")
const EXIT_MODAL = preload("res://ui/exit_modal.tscn")
@onready var main_menu: CanvasLayer = $main_menu
@onready var parallax_background_2: ParallaxBackground = $ParallaxBackground2

# CLICK SOUND EFFECT
@onready var click_sound: AudioStreamPlayer = $main_menu/click_sound

func _on_exit_button_pressed() -> void:
	click_sound.play()
	main_menu.visible = false
	var exit_modal = EXIT_MODAL.instantiate()
	main_menu.add_child(exit_modal)

func _on_settings_button_pressed() -> void:
	click_sound.play()
	main_menu.visible = false
	var options_menu = OPTIONS.instantiate()
	main_menu.add_child(options_menu)

func _on_start_button_pressed() -> void:
	click_sound.play()
	SceneManager.change_scene(
  "res://ui/ Opening_Story.tscn",
  { "pattern": "scribbles", "pattern_leave": "scribbles" }
)
