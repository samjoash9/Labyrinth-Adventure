extends Area2D
class_name RangedAttack

var direction
var damage 
var speed
var sprite

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta
	$Sprite.sprite_frames = sprite
	$Sprite.play("default")
	
func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)
		queue_free()
