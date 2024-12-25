extends CanvasLayer

@onready var click_sound: AudioStreamPlayer2D = $"../click_sound"

func _on_restart_pressed() -> void:
	click_sound.play()
	SceneManager.fade_in()
	get_tree().reload_current_scene()
	visible = false

func _on_quit_pressed() -> void:
	click_sound.play()
	SceneManager.change_scene(
	"res://ui/map.tscn",
  { "pattern": "scribbles", "pattern_leave": "scribbles"})
