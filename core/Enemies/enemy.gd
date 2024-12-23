extends CharacterBody2D

@export var target: Node2D
@onready var pathfinder: NavigationAgent2D = $NavigationAgent2D
var movementSpeed: float = 100
var direction

func _ready() -> void:
	pathfinder.target_position = target.global_position

func _physics_process(delta: float) -> void:
	direction = pathfinder.get_next_path_position().normalized()
	velocity = direction * movementSpeed
	if pathfinder.avoidance_enabled:
		pathfinder.set_velocity(velocity)
	else:
		_on_navigation_agent_2d_velocity_computed(velocity)
	
func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
