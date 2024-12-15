extends Node2D
@onready var animation_tree: AnimationTree = $AnimationTree

enum {
	IDLE,
	MOVE,
	DEAD
} 

var direction = 0

@onready var state = IDLE

func _process(delta: float) -> void:
	animation_tree["parameters/Move/blend_position"] = direction
	animation_tree["parameters/Idle/blend_position"] = direction
	animation_tree["parameters/Death/blend_position"] = direction
	
