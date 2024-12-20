extends Upgrade

func useAttack():
	var instance: Projectile = load(upgradeInfo.get_projectile_path()).instantiate()
	instance.global_position = projectileSpawnPoint.global_position
	instance.global_rotation = projectileSpawnPoint.global_rotation
	match upgradeInfo.level:
		1:
			attack_timer.wait_time = upgradeInfo.attackSpeed
		2: 
			attack_timer.wait_time = .8
		3:
			attack_timer.wait_time = .5
			instance.scale = Vector2(1.5,1.5)
		4: 
			attack_timer.wait_time = .1
		5: 
			attack_timer.wait_time = 0.001
	add_child(instance)
