extends CharacterBody2D

class_name Player

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var camera: Camera = $camera
@onready var weapon: Node2D = $Weapon

var inputDir = Vector2.ZERO
var mouseDir

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		$Weapon/Sword.playAttack((get_global_mouse_position()- weapon.global_position).normalized().x)

func _physics_process(delta: float) -> void:
	weapon.look_at(get_global_mouse_position()-weapon.global_position.normalized())
	updateMovement(delta)
	updateAnimation()
	move_and_slide()
	
func updateAnimation():
#	Player Animation
	mouseDir = (get_global_mouse_position() - global_position).normalized().x
	if inputDir == Vector2.ZERO: 
		animation_tree["parameters/conditions/idle"] = true
		animation_tree["parameters/conditions/is_moving"] = false
		animation_tree["parameters/Idle/blend_position"] = mouseDir
	else:
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/is_moving"] = true
		animation_tree["parameters/Move/blend_position"] = mouseDir
		
		
func updateMovement(delta:float):
	inputDir = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = inputDir * 8000 * delta
	velocity.normalized()
