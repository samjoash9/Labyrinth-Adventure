extends Node2D
class_name Animations

@onready var playerNode : CharacterBody2D = get_parent()
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playerComponent: Player = get_tree().get_first_node_in_group("player")
var mouseDIR

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if playerNode:
#		SET BLENDING OF 1D NODE IN ANIMATION TREE BASED ON THE MOUSE POSITION RELATIVE TO THE PLAYER
#		MAKES THE SPRITE LOOK AT WHERE THE MOUSE IS
		mouseDIR = (get_global_mouse_position() - playerComponent.global_position).normalized().x
		animation_tree["parameters/Idle/blend_position"] = mouseDIR
		animation_tree["parameters/Move/blend_position"] = mouseDIR
		animation_tree["parameters/Dead/blend_position"] = mouseDIR
		
		if playerComponent.state!= playerComponent.states.DEAD:
				if playerComponent.velocity:
					playerComponent.state  = playerComponent.states.MOVE
				else:
					playerComponent.state = playerComponent.states.IDLE
		else:
			set_process(false)
