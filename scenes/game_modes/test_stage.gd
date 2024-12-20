extends Node2D
const AKANAME = preload("res://enemies/dungeon/akaname/akaname.tscn")

func _on_timer_timeout() -> void:
	add_child(AKANAME.instantiate())


func _on_look_timer_timeout() -> void:
	pass # Replace with function body.
