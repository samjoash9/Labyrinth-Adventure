extends Node2D
class_name HealthComponent

# A health component that Keeps Track of hp of entities
signal max_health_changed(diff: int)
signal health_changed(diff: int)
signal health_depleted

@export var max_health: int = 100 : set = set_max_health, get = get_max_health
@onready var health: int = max_health : set = set_health, get = get_health

# max health ===================================================
func set_max_health(value: int):
	var clamped_value = 1 if value <= 0 else value
	
	if not clamped_value == max_health:
		var difference = clamped_value - max_health
		max_health = value
		max_health_changed.emit(difference)

		if health > max_health:
			health = max_health

func get_max_health() -> int:
	return max_health

# health ======================================================
func set_health(value: int):
	if value < health:
		return
	
	"""
	clamp function = (val, min, max)
	returns:
		val, if min < val < max
		min, if val < min
		max, if val > max

	"""
	
	var clamped_value = clampi(value, 0, max_health)
	
	if clamped_value != health:
		var difference = clamped_value - health
		health = value
		health_changed.emit(difference)
		
		if health == 0:
			health_depleted.emit()

func get_health() -> int:
	return health

func damage():
	pass

func heal():
	pass
	
