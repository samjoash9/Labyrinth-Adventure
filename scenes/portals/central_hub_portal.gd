extends AnimatedSprite2D

func _on_area_2d_body_entered(body: PhysicsBody2D) -> void:
	GameManager.central_hub_last_position = $"../Player".global_position
	print(GameManager.central_hub_last_position)
	SceneManager.change_scene(
  'res://ui/map.tscn',
  { "pattern": "scribbles", "pattern_leave": "scribbles" }
)
