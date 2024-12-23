extends CharacterBody2D

@export var target: Node2D:
	set(value):
		target = value
		pathfinder.target_position = target.global_position
@onready var pathfinder: NavigationAgent2D = $NavigationAgent2D
var movementSpeed: float = 100
var direction

func _ready() -> void:
	await get_tree().create_timer(.1).timeout

func seeker_setup():
	await get_tree().physics_frame
	if target:
		pathfinder.target_position = target.global_position

func _physics_process(delta: float) -> void:
	if target:
		pathfinder.target_position = target.global_position
	
	if pathfinder.is_navigation_finished():
		return
	
	var current_agent_position = global_position
	var next_path_position = pathfinder.get_next_path_position()
	direction = current_agent_position.direction_to(next_path_position)
	velocity = direction * movementSpeed
	
	
