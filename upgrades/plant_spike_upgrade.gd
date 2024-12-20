extends Node2D

const PLANT_SPIKE = preload("res://upgrades/plant_spike.tscn")
@onready var scanner : EnemyScanner = get_tree().get_first_node_in_group("scanner")
@onready var marker_2d: Marker2D = $Marker2D
@onready var attack_timer: Timer = $AttackTimer

@onready var level = 1

@onready var target = scanner.get_target()

func _ready() -> void:
	attack_timer.timeout.connect(onCooldown)
	look_at(scanner.get_random_target())
	
	
func onCooldown():
	if is_instance_valid(target):
		match level:
			1:
				var instance =  PLANT_SPIKE.instantiate()
				instance.global_position = marker_2d.global_position
				instance.global_rotation = marker_2d.global_rotation
				add_child(instance)

func _process(delta: float) -> void:
	if is_instance_valid(target):
		look_at(target.position)
	else:
		target = scanner.get_target()
	if target == null:
		look_at(get_global_mouse_position())
