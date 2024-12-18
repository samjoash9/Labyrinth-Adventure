class_name healthComponent
extends Node2D

@export var HitPoints: float

func attacked(damage: float):
	print(HitPoints)
	if HitPoints-damage > 0: 
		HitPoints-= damage
	else:
		get_parent().queue_free()
