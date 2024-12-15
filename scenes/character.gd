extends CharacterBody2D

@onready var characterResource : CharacterResource


func _ready() -> void:
	var selected = 0
	match selected:
		0:
			characterResource = load("res://Resources/knight.tres")
		1: 
			characterResource = load("res://Resources/rouge.tres")
		
	add_child(characterResource.animations.instantiate())
	
func _process(delta: float) -> void:
	var inputDir = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = inputDir * characterResource.movementSpeed * 100 * delta
	velocity.normalized()
	move_and_slide()
