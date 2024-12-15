extends CharacterBody2D

@export var characterResource : CharacterResource

func _ready() -> void:
	add_child(characterResource.animations.instantiate())
	
func _process(delta: float) -> void:
	var inputDir = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = inputDir * characterResource.movementSpeed * 100 * delta
	velocity.normalized()
	move_and_slide()
	
