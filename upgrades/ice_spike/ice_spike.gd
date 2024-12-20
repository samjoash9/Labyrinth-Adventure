extends Upgrade

func useAttack():
	var instance: Projectile = load(upgradeInfo.get_projectile_path()).instantiate()
	instance.global_position = projectileSpawnPoint.global_position
	instance.global_rotation = projectileSpawnPoint.global_rotation

	match upgradeInfo.level:
		1:
			pass
	add_child(instance)
