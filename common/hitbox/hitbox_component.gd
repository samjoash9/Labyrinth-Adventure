
class_name hitBoxComponent
extends Area2D

@export var damage:float = 1 :
	set(value): damage = value
	get: return damage

@export var knockback: float  = 10 :
	get : 
		return knockback
	set(value): 
		knockback = value
	
