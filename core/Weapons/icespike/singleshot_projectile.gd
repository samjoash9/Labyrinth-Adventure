extends Area2D
class_name SingleShotProjectile

var direction
var speed = 100
var attackPower
var knockBack

func _process(delta: float) -> void:
	position += direction * speed * delta
	
func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(attackPower, (self.global_position-body.global_position).normalized() * Vector2(knockBack,knockBack))
		queue_free()
	else:
		queue_free()
