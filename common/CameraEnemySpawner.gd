extends Camera2D
@onready var path_follow_2d: PathFollow2D = $Path2D/PathFollow2D
const AKANAME = preload("res://enemies/dungeon/akaname/akaname.tscn")


func spawnEnemy():
	var enemyInstance = AKANAME.instantiate()
	path_follow_2d.progress_ratio = randf()
	enemyInstance.global_position = path_follow_2d.global_position
	get_parent().get_parent().add_sibling(enemyInstance)


func _on_timer_timeout() -> void:
	#spawnEnemy()
	pass
