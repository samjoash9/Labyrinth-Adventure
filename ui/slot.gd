extends PanelContainer
class_name Slot

@export var slotPosition: Vector2
@onready var progress_bar: TextureProgressBar = $TextureProgressBar

var weaponInstance: Node2D

@export var item: Weapon:
	set(value):
		item = value
		%TextureRect.texture = item.icon
		%Cooldown.wait_time = item.coolDown
		
func _on_cooldown_timeout() -> void:
	if item:
		if item.weaponType == item.weaponTypes.PROJECTILE:
			if item is SingleShot:
				var projectile: SingleShotProjectile = item.projectile.instantiate()
				projectile.global_rotation = weaponInstance.global_rotation
				projectile.attackPower = item.attackPower
				projectile.speed = item.attackSpeed
				projectile.knockBack = item.knockBack
				projectile.global_position = weaponInstance.global_position
				if owner.nearest_enemy != null:
					projectile.direction = owner.nearest_enemy.position
				else:
					projectile.direction = Vector2.RIGHT
				owner.add_child(projectile)
		if item.weaponType == item.weaponTypes.MELEE:
			if weaponInstance.has_method("attack"):
				weaponInstance.attack()
				weaponInstance.animation_player.speed_scale = 2 * (weaponInstance.animation_player.current_animation_length/item.coolDown)
		
		%Cooldown.wait_time = item.coolDown
		progress_bar.max_value = %Cooldown.wait_time
		item.activate()
		
func _process(_delta: float) -> void:
	if %Cooldown.is_stopped() == false:
		progress_bar.value = %Cooldown.time_left
	else:
		progress_bar.value = 0

func createWeapon():
	weaponInstance = item.weaponNode.instantiate()
	weaponInstance.global_position = slotPosition
	owner.add_child.call_deferred(weaponInstance)
