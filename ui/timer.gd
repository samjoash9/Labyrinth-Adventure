extends Timer

func _ready() -> void:
	wait_time = GameManager.selected_level * 60
