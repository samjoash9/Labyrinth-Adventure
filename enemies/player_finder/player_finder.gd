extends NavigationAgent2D
class_name PlayerFinder

@onready var player : playerCharacter = get_tree().get_first_node_in_group("player")
@onready var body : Enemy
@onready var moveSpeed : float = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _ready() -> void:
	#if is_instance_of(get_parent(), Enemy):
		##body = get_parent()
		##target_position = body.global_position
		pass
		
func _process(_delta: float) -> void:
	if player: 
		body.direction = body.to_local(get_next_path_position()).normalized()
		var bodyVelocity = body.direction * moveSpeed
		if avoidance_enabled:
			set_velocity(bodyVelocity)
		else:
			_on_velocity_computed(bodyVelocity)
	
func _on_velocity_computed(safe_velocity: Vector2) -> void:
	body.velocity = safe_velocity

func _on_timer_timeout() -> void:
	if player:
		target_position = player.global_position
