extends Node2D

const KUNAI = preload("res://upgrades/kunai.tscn")
@onready var scanner : EnemyScanner = get_tree().get_first_node_in_group("scanner")
@onready var marker_2d: Marker2D = $Marker2D
@onready var attack_timer: Timer = $AttackTimer

@onready var level = 1

@onready var target = scanner.get_target()

func _ready() -> void:
	look_at(scanner.get_random_target())

func _on_attack_timer_timeout() -> void:
	if is_instance_valid(target):
		match level:
			1:
				var kunaiInstance = KUNAI.instantiate()
				kunaiInstance.global_position = marker_2d.global_position
				kunaiInstance.global_rotation = marker_2d.global_rotation
				add_child(kunaiInstance)
			2:
				var kunaiInstance = KUNAI.instantiate()
				kunaiInstance.global_position = marker_2d.global_position
				kunaiInstance.global_rotation = marker_2d.global_rotation
				kunaiInstance.scale = Vector2(5,5)
				kunaiInstance.is_peircing = true
				add_child(kunaiInstance)

func _process(delta: float) -> void:
	if is_instance_valid(target):
		look_at(target.position)
	else:
		target = scanner.get_target()
	if target == null:
		look_at(get_global_mouse_position())
