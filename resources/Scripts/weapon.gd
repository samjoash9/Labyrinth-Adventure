extends Item
class_name Weapon

enum weaponTypes {
	MELEE,
	PROJECTILE,
	MAGIC,
	SUMMON
}

@export_category("Weapon Description")
@export var weaponType: weaponTypes
@export var upgrades: Array[Upgrade]

@export_category("Weapon Stats")
@export var attackPower : float
@export var attackSpeed : float
@export var coolDown: float
@export var critChance : float
@export var critDamage : float
@export var knockBack: float
@export var weaponNode : PackedScene


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

func upgradeFunction():
	var upgrade = upgrades[level-1]
	attackPower += upgrade.attackPower
	coolDown += upgrade.coolDown
	attackSpeed += upgrade.attackSpeed
	level+= 1
	
	
