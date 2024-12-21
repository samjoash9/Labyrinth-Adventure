extends Resource
class_name Weapon

enum weaponTypes {
	MELEE,
	PROJECTILE,
	MAGIC,
	SUMMON
}
var level = 1
@export_category("Weapon Description")
@export var name : String
@export_multiline var weaponDescription: String
@export var weaponIcon : Texture2D
@export var weaponType: weaponTypes
@export var upgrades: Array[Upgrade]

@export_category("Weapon Stats")
@export var attackPower : float
@export var attackSpeed : float
@export var coolDown: float
@export var critChance : float
@export var critDamage : float
@export var knockBack: float
@export var weaponAnimations : Resource

func activate():
	pass

func is_upgradable() ->bool:
	if level <= upgrades.size():
		return true
	return false
	

func upgrade_item():
	if not is_upgradable():
		return
	upgradeFunction()
	level+= 1

func upgradeFunction():
	pass
