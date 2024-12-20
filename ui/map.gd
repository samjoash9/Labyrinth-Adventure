extends Node2D

@onready var camera: Camera2D = $Camera

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_UP:
		camera.position.y -= 15
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
		camera.position.y += 15

func _on_return_button_pressed() -> void:
	SceneManager.change_scene(
	"res://scenes/central_hub.tscn",
  { "pattern": "scribbles", "pattern_leave": "scribbles"})
