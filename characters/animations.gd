extends Node2D
class_name Animations

@onready var playerNode : CharacterBody2D = get_parent()
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playerComponent: playerCharacter = get_tree().get_first_node_in_group("player")
var mouseDIR
const KNOCKBACKSPEED = 30

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playerComponent.hurt_box.hurt.connect(onHurt)
	playerComponent.hurt_box.dead.connect(on_death)
	
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
			if playerComponent.state != playerComponent.states.HURT:
				if playerComponent.velocity:
					playerComponent.state  = playerComponent.states.MOVING
				else:
					playerComponent.state = playerComponent.states.IDLE

func onHurt(hurtDirection: Variant, knockback: Variant):
	playerComponent.state = playerComponent.states.HURT
	playerComponent.velocity += (-hurtDirection*knockback) * KNOCKBACKSPEED
	animation_tree["parameters/Hurt/blend_position"] = hurtDirection.x
	playerComponent.move_and_slide()
	
func on_death():
	playerComponent.state = playerComponent.states.DEAD
	
func resetState():
	playerComponent.state = playerComponent.states.IDLE

func disableHurtBox():
	playerComponent.hurt_shape.set_deferred("disabled", true)
	
func set_bodies(val: bool):
	playerComponent.set_process(val)
	set_process(val)
