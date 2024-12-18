extends Node2D
var travelled = 0
const SPEED = 300
const RANGE = 100

func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	position+= direction * SPEED * delta
	travelled += SPEED * delta
	
	if travelled > RANGE:
		queue_free()
