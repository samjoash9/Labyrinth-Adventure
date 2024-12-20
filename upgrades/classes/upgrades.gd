extends Node2D
class_name Upgrade

@export var upgradeInfo : UpgradeResource

@onready var scanner : EnemyScanner = get_tree().get_first_node_in_group("scanner")
@onready var projectileSpawnPoint : Marker2D = $projectileSpawnPoint
@onready var attack_timer: Timer = Timer.new()
@onready var target = scanner.get_target()

func _ready() -> void:
	
	attack_timer.timeout.connect(onCooldown)
	attack_timer.wait_time = upgradeInfo.attackCoolDown
	attack_timer.autostart = true
	add_child(attack_timer)
	look_at(scanner.get_random_target())
	
func onCooldown():
	if is_instance_valid(target):
		useAttack()

func _process(delta: float) -> void:
	if is_instance_valid(target):
		look_at(target.position)
	else:
		target = scanner.get_target()
	if target == null:
		look_at(get_global_mouse_position())

func useAttack() -> void:
	pass
