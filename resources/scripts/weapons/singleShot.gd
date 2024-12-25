extends Weapon
class_name SingleShot

@export var projectile : PackedScene

func shoot(scene_tree:Node2D):
	var instance : Node2D = projectile.instantiate()
	instance.direction = scene_tree.global_position.direction_to(scene_tree.get_global_mouse_position())
	instance.speed = attackSpeed
	instance.attackPower = attackPower
	instance.knockBack = knockBack
	instance.global_rotation =  scene_tree.global_rotation
	instance.global_position = scene_tree.global_position
	scene_tree.add_child(instance)
