extends Node2D
class_name Animations

@onready var playerNode : CharacterBody2D = get_parent()
@onready var animation_tree: AnimationTree = $AnimationTree
var mouseDIR
var state

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playerNode:
#		SET BLENDING OF 1D NODE IN ANIMATION TREE BASED ON THE MOUSE POSITION RELATIVE TO THE PLAYER
#		MAKES THE SPRITE LOOK AT WHERE THE MOUSE IS
		mouseDIR = (get_global_mouse_position() - playerNode.global_position.normalized()).x
		animation_tree["parameters/Death/blend_position"] = mouseDIR
		animation_tree["parameters/Idle/blend_position"] = mouseDIR
		animation_tree["parameters/Move/blend_position"] = mouseDIR
		
func disableBody():
	set_process(false)
