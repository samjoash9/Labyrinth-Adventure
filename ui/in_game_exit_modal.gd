extends CanvasLayer

func _on_quit_pressed() -> void:
	SceneManager.change_scene(
	"res://scenes/central_hub.tscn",
  { "pattern": "scribbles", "pattern_leave": "scribbles"})

func _on_cancel_pressed() -> void:
	get_parent().visible = true
	visible = false
