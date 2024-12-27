extends Weapon
class_name SingleShot

@export var projectile : PackedScene


func shoot(scenetree: Node2D, weaponComponent: Node2D):
	var projectileInstance:SingleShotProjectile = projectile.instantiate()
	projectileInstance.attackPower = attackPower
	projectileInstance.knockBack = knockBack
	projectileInstance.speed = attackSpeed
	projectileInstance.global_position = weaponComponent.global_position
	projectileInstance.global_rotation = weaponComponent.global_rotation
	var rad = weaponComponent.global_rotation
	projectileInstance.direction = Vector2(cos(rad), sin(rad))
	scenetree.add_child(projectileInstance)
	
