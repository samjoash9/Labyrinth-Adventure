extends Node2D
const SPEED = 300
const RANGE = 500

func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	position+= direction * SPEED * delta
	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
