extends Node2D
class_name AutoAimNearestRanged

func _process(_delta: float) -> void:
	if get_tree().get_first_node_in_group("player").nearest_enemy != null:
		look_at(get_tree().get_first_node_in_group("player").nearest_enemy.global_position)
	else:
		look_at(get_global_mouse_position())
	
