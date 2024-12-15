extends CharacterBody2D
@onready var animation_tree: AnimationTree = $AnimationTree

func updateAnimation(direction):
	animation_tree["parameters/Move/blend_position"] = direction
	
