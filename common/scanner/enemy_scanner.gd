extends Area2D
class_name EnemyScanner

var bodies_entered := []

func _on_body_entered(body: Node2D) -> void:
	if not bodies_entered.has(body):
		bodies_entered.append(body)

func _on_body_exited(body: Node2D) -> void:
	if bodies_entered.has(body):
		bodies_entered.erase(body)

func get_random_target():
	if bodies_entered.size()> 0:
		return bodies_entered.pick_random().global_position
	else:
		return Vector2.UP
		
func get_target():
	if bodies_entered.size() > 0:
		return bodies_entered.pick_random()
