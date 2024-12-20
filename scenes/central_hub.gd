extends Node2D
class_name central_hub

@onready var player: playerCharacter = $Player 

func _ready() -> void:
	var position = GameManager.central_hub_last_position
	if position.x >= 223 and position.x <= 273 and position.y >= -68 and position.y <= -12:
		player.position = Vector2(248, -4) 
		GameManager.central_hub_last_position = Vector2(0, 0)
