extends AnimatedSprite2D

@onready var player: Player = $"../Player"
@onready var portal_sound: AudioStreamPlayer2D = $portal_sound

func _on_area_2d_body_entered(body: PhysicsBody2D) -> void:
	portal_sound.play()
	GameManager.central_hub_last_position = player.global_position
	
	SceneManager.change_scene(
	'res://ui/map.tscn',
	{ "pattern": "scribbles", "pattern_leave": "scribbles" })
