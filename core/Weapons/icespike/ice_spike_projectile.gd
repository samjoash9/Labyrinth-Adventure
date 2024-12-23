extends Area2D
class_name SingleShotProjectile

var direction
var speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta
	
func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()
