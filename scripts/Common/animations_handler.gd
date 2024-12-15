extends Node2D

@export var bodyReference: CharacterBody2D

enum {
	IDLE,
	MOVE,
	ATTACK,
	HURT,
	DEATH
}

@onready var state = IDLE

func _process(delta: float) -> void:
	if bodyReference.velocity:
		state = MOVE
	else: 
		state = IDLE
