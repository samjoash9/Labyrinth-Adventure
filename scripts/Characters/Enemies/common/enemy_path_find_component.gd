extends NavigationAgent2D
class_name pathFinder
@export var Speed : float = 20
@onready var playerReference: CharacterBody2D = get_node("../../Knight")
@export var bodyReference: CharacterBody2D

var canMove = true
var dir
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target_position = playerReference.global_position

func _process(delta: float) -> void:
	if canMove:
		dir = bodyReference.to_local(get_next_path_position()).normalized()
		var bodyVelocity = dir * Speed
		if avoidance_enabled: 
			self.set_velocity(bodyVelocity)
		else:
			_on_velocity_computed(bodyVelocity)
		bodyReference.move_and_slide()
	
func _on_timer_timeout() -> void:
	if playerReference != null:
		target_position = playerReference.global_position

func _on_velocity_computed(safe_velocity: Vector2) -> void:
	bodyReference.velocity = safe_velocity
