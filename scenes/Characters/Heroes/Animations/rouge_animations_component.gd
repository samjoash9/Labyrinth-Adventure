extends animationsComponent
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var characterBody : CharacterBody2D = get_parent()

func _process(delta: float) -> void:
	updateState()
	var direction = (get_global_mouse_position() - global_position).normalized().x
	animation_tree["parameters/Move/blend_position"] = direction
	animation_tree["parameters/Idle/blend_position"] = direction
	animation_tree["parameters/Death/blend_position"] = direction

func updateState():
	if characterBody.velocity:
		to_moving()
	if !characterBody.velocity:
		to_idle()
