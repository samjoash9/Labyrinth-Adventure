extends CanvasLayer

func _on_button_pressed() -> void:
	SceneManager.change_scene(
	"res://scenes/central_hub.tscn",
  { "pattern": "scribbles", "pattern_leave": "scribbles" }
)
