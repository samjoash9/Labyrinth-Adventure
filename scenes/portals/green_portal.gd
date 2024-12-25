extends AnimatedSprite2D

@onready var player: Player = $"../Player"
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

func _on_maze_generator_last_index(portal_position: Vector2i) -> void:
	position = portal_position

func _on_timer_timeout() -> void:
	visible = true
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.8, 0.8), 1)
	player.set_process(false)
	await get_tree().create_timer(2).timeout
	player.set_process(true)
	collision_shape_2d.disabled = false
