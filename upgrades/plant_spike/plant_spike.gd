extends Upgrade

const PLANT_SPIKE = preload("res://upgrades/plant_spike.tscn")

func useAttack():
	var instance = PLANT_SPIKE.instantiate()
	instance.global_position = projectileSpawnPoint.global_position
	instance.global_rotation = projectileSpawnPoint.global_rotation
	match upgradeInfo.level:
		1:
			upgradeInfo.attackSpeed = upgradeInfo.attackSpeed
		2: 
			upgradeInfo.attackCoolDown *= .8
		3:
			upgradeInfo.attackCoolDown *= .8
			instance.scale = Vector2(1.5,1.5)
	add_child(instance)
