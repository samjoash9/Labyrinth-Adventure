extends animationsComponent
@onready var characterBody : CharacterBody2D = get_parent()
@onready var animation_tree: AnimationTree = $AnimationTree

func updateState():
	if characterBody.velocity:
		to_moving()
	if !characterBody.velocity:
		to_idle()

func _process(delta: float) -> void:
	updateState()
	var direction = (get_global_mouse_position() - global_position).normalized().x
	animation_tree["parameters/Idle/blend_position"] = direction
	animation_tree["parameters/Move/blend_position"] = direction
	animation_tree["parameters/Dead/blend_position"] = direction
