extends CharacterBody2D
@onready var rouge_animations: Node2D = $RougeAnimations

var inputDir
var mouseDir

func _physics_process(delta: float) -> void:
	mouseDir = (get_global_mouse_position() - global_position).normalized().x
	rouge_animations.direction = mouseDir
	if velocity:
		rouge_animations.state = 1
	else:
		rouge_animations.state = 0
	updateMovement(delta)
	move_and_slide()
	
func updateMovement(delta:float):
	inputDir = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = inputDir * 8000 * delta
	velocity.normalized()
