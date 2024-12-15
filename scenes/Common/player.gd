extends CharacterBody2D
@onready var rouge_animations: Node2D = $RougeAnimations

var inputDir
var mouseDir

func _physics_process(delta: float) -> void:
	updateMovement(delta)
	move_and_slide()
	
func updateMovement(delta:float):
	inputDir = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = inputDir * 8000 * delta
	velocity.normalized()
