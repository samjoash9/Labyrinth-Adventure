extends Weapon
class_name MultiShot

@export var projectile : PackedScene
@export var projectileCount : int

func upgradeFunction():
	var upgrade = upgrades[level-1]
	projectileCount +=  upgrade.projectileCount

func shoot(scenetree: Node2D, weaponComponent: Node2D):
	
	var angle_spread = PI / 2  # 90 degrees in radians
	var base_rotation = weaponComponent.global_rotation
	var start_rotation = base_rotation - (angle_spread / 2.0)
	var step_rotation = angle_spread / max(projectileCount - 1, 1)  # Prevent division by zero for a single projectile

	for i in range(projectileCount):
		var projectile_instance = projectile.instantiate()
		# Set projectile properties
		projectile_instance.attackPower = attackPower
		projectile_instance.knockBack = knockBack
		projectile_instance.speed = attackSpeed
		projectile_instance.global_position = weaponComponent.global_position
		
		# Calculate rotation and direction
		var rotation = start_rotation + (i * step_rotation)
		projectile_instance.global_rotation = rotation
		projectile_instance.direction = Vector2(cos(rotation), sin(rotation))
		
		# Add the projectile to the scene tree
		scenetree.add_child(projectile_instance)
