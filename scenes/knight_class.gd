extends Character
@onready var sprite_animation_tree: AnimationTree = $SpriteAnimationTree
@onready var weapon: Node2D = $Weapon

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func updateAnimation():
	sprite_animation_tree["parameters/Move/blend_position"] = mouseDir.x
	sprite_animation_tree["parameters/Idle/blend_position"] = mouseDir.x
	sprite_animation_tree["parameters/Death/blend_position"] = mouseDir.x

func updateWeaponPosition():
	weapon.look_at((get_global_mouse_position()-weapon.global_position.normalized()))
	
