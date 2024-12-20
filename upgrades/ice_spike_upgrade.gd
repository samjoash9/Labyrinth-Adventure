extends Node2D
const ICE_SPIKE = preload("res://upgrades/ice_spike.tscn")
@onready var scanner : EnemyScanner = get_tree().get_first_node_in_group("scanner")
@onready var marker_2d: Marker2D = $Marker2D
@onready var attack_timer: Timer = $AttackTimer

@onready var target = scanner.get_target()

func _ready() -> void:
	look_at(scanner.get_random_target())

func _on_attack_timer_timeout() -> void:
	if is_instance_valid(target):
		var iceSpikeInstance = ICE_SPIKE.instantiate()
		iceSpikeInstance.global_position = marker_2d.global_position
		iceSpikeInstance.global_rotation = marker_2d.global_rotation
		add_child(iceSpikeInstance)

func _process(delta: float) -> void:
	if is_instance_valid(target):
		look_at(target.position)
	else:
		target = scanner.get_target()
	if target == null:
		look_at(get_global_mouse_position())
