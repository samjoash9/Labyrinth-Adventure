extends Control
signal loaded

const OPTIONS = preload("res://scenes/UI/options.tscn")
const MAIN = preload("res://Main.tscn")
@onready var main_menu: CanvasLayer = $main_menu

func _on_exit_button_pressed() -> void:
	get_tree().quit()
	await get_tree().process_frame
	emit_signal("loaded")

func _on_settings_button_pressed() -> void:
	main_menu.visible = false
	var options_menu = OPTIONS.instantiate()
	main_menu.add_child(options_menu)

func _on_start_button_pressed() -> void:
	SceneManager.change_scene(
  'res://scenes/central_hub.tscn',
  { "pattern": "scribbles", "pattern_leave": "scribbles" }
)
