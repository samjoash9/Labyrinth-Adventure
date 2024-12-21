extends CharacterBody2D
class_name playerCharacter

enum states{
	IDLE,
	MOVING,
	DEAD,
	HURT
}

@onready var hurt_shape: CollisionShape2D = $HurtBox/HurtShape
@onready var hurt_box: HurtBox = $HurtBox
@onready var enemy_scanner: EnemyScanner = $EnemyScanner
@onready var magnet_area: CollisionShape2D = $Item_Magnet/MagnetArea
@onready var upgrade_slots: Node2D = $UpgradeSlots
@onready var applied_upgrades: Node2D = $AppliedUpgrades

var state = states.IDLE
var SPEED : float = 0
var SELECTED_CLASS : CharacterResource

func _ready() -> void:
#	Load Selected Class Resource
	SELECTED_CLASS  = load(GameManager.get_selected_character())
	
#	Create Instances Of the Class Body, Primary weapon, and Unique Skill
	if SELECTED_CLASS: 
		instancePlayerAnimations()
		#instanceWeaponAnimations()
		instanceUniqueAnimations()

func instancePlayerAnimations():
	if SELECTED_CLASS.animationComponent:
		var player = SELECTED_CLASS.animationComponent.instantiate()
		add_child(player)

func instanceWeaponAnimations():
	if SELECTED_CLASS.weapon.weaponAnimations:
		var weapon = SELECTED_CLASS.weapon.weaponAnimations.instantiate()
		add_child(weapon)
		weapon.position = Vector2(0,-9)
		weapon.get_node("AnimationPlayer").speed_scale = SELECTED_CLASS.weapon.attackSpeed

func instanceUniqueAnimations():
	pass
	
func _process(_delta: float) -> void:
	if SELECTED_CLASS:
		if SELECTED_CLASS.basicStats.Hitpoints > 0:
				var inputDir = Input.get_vector("left", "right", "up", "down").normalized()
				velocity = inputDir * SPEED
				velocity.normalized()
				move_and_slide()

func set_position_to_random_slot(upgradeItem : Upgrade):
	if upgrade_slots.get_child_count() > 0:
		upgradeItem.global_position = upgrade_slots.get_children().pick_random().global_position
	else:
		return

func add_upgrade(upgradeItem : Upgrade):
	if upgrade_slots.get_child_count() > 0:
		set_position_to_random_slot(upgradeItem)
	else:
		return
