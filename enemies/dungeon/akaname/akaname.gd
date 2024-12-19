extends CharacterBody2D

@onready var animation_tree: AnimationTree = $AnimationTree

var SPEED = 30
var state = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_and_slide()


func _on_hurt_box_hurt(hurtDirection: Variant, knockback: Variant) -> void:
	velocity += (-hurtDirection*knockback) * SPEED
	state = 1
	animation_tree["parameters/Hurt/blend_position"] = -hurtDirection.x
	velocity.normalized()
	await get_tree().create_timer(.1).timeout
	velocity = Vector2.ZERO
	state = 0
	
