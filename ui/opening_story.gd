extends CanvasLayer

@onready var click_sound: AudioStreamPlayer2D = $control_menu/click_sound

func _on_button_pressed() -> void:
	click_sound.play()
	SceneManager.change_scene(
	"res://scenes/central_hub.tscn",
  { "pattern": "scribbles", "pattern_leave": "scribbles" }
)
