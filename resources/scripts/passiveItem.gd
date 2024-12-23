extends Item
class_name Passives

@export var upgrades: Array[Stats]
var player_reference

func is_upgradable() -> bool:
	if level <= upgrades.size():
		return true
	return false

func upgrade_item():
	if not is_upgradable():
		return
	if player_reference == null:
		return
	var upgrade = upgrades[level-1]
	
	player_reference.hitPoints += upgrade.hitPoints
	player_reference.maxHitpoints+=upgrade.maxHitpoints
	player_reference.movementSpeed +=upgrade.moveSpeed
	player_reference.might+=upgrade.might
	player_reference.armor+=upgrade.armor
	player_reference.magnetArea +=upgrade.magnetArea
	player_reference.areaMultiplier+=upgrade.areaMultiplier
	player_reference.growth+=upgrade.growth
	
	level +=1
