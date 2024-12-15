class_name healthComponent
extends Node2D

@export var HitPoints: float
@export var hurtDirection: pathFinder

func attacked(damage: float):
	if HitPoints-damage > 0: 
		HitPoints-= damage
	else:
		get_parent().queue_free()
