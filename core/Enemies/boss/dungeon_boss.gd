extends CharacterBody2D
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D

enum {
	IDLE,
	MOVE,
	ATTACK,
	ATTACKCHARGE,
	ATTACKRANGE,
	TELEPORT,
	DEAD,
}

@onready var playerReference : Player = get_tree().get_first_node_in_group("player")
var moveSpeed = 20
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	navigation_agent_2d.target_position = playerReference.global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playerReference:
		var current_agent_position = global_position
		var next_path_position = navigation_agent_2d.get_next_path_position()
		var new_velocity = current_agent_position.direction_to(next_path_position) * moveSpeed
		if navigation_agent_2d.avoidance_enabled:
			navigation_agent_2d.set_velocity(new_velocity)
		else:
			_on_navigation_agent_2d_velocity_computed(new_velocity)
		move_and_slide()
		navigation_agent_2d.target_position = playerReference.global_position
func teleport_to_player():
	global_position = playerReference.global_position
	
func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
