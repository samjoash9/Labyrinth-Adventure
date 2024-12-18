extends Character

@onready var sprite_animation_tree: AnimationTree = $SpriteAnimationTree
@onready var weapon: Node2D = $Weapon
@onready var knight_aura: Node2D = $KnightAura
@onready var bone_sword: Area2D = $Weapon/BoneSword
func updateAnimation():
	sprite_animation_tree["parameters/Move/blend_position"] = mouseDir.x
	sprite_animation_tree["parameters/Idle/blend_position"] = mouseDir.x
	sprite_animation_tree["parameters/Death/blend_position"] = mouseDir.x
	sprite_animation_tree["parameters/Hurt/blend_position"] = mouseDir.x

func updateWeaponPosition():
	weapon.look_at((get_global_mouse_position()-weapon.global_position.normalized()))
	
func useUniqueSkill():
	knight_aura.activateSkill()
	
func manageStates():
	if velocity:
		state=MOVING
	else:
		state=IDLE
	
func _on_hurt_box_component_hurt() -> void:
	set_process(false)
	state = HURT
	
