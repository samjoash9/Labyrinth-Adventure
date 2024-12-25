extends PanelContainer
class_name Slot

@export var slotPosition: Vector2
@onready var progress_bar: ProgressBar = $ProgressBar

var weaponInstance: Node2D

@export var item: Weapon:
	set(value):
		item = value
		%TextureRect.texture = item.icon
		%Cooldown.wait_time = item.coolDown
		
func _on_cooldown_timeout() -> void:
	if item:
		if item.weaponType == item.weaponTypes.PROJECTILE:
			if item.has_method("shoot"):
				item.shoot(weaponInstance)
		if item.weaponType == item.weaponTypes.MELEE:
			if weaponInstance.has_method("attack"):
				weaponInstance.attack()
				weaponInstance.animation_player.speed_scale = 2 * (weaponInstance.animation_player.current_animation_length/item.coolDown)
		
		%Cooldown.wait_time = item.coolDown
		$ProgressBar.max_value = %Cooldown.wait_time
		item.activate()
		
func _process(_delta: float) -> void:
	if %Cooldown.is_stopped() == false:
		$ProgressBar.value = %Cooldown.time_left
	else:
		$ProgressBar.value = 0

func createWeapon():
	weaponInstance = item.weaponNode.instantiate()
	weaponInstance.global_position = slotPosition
	owner.add_child.call_deferred(weaponInstance)
