extends CanvasLayer

@onready var player_hud: CanvasLayer = $"../Player/HUD"
@onready var player: Player = $"../Player"

const IN_GAME_PAUSE = preload("res://ui/in_game_pause.tscn")

func _on_button_pressed() -> void:
	player.set_process(false)
	player_hud.visible = false
	visible = false
	
	# add in game pause canvas layer
	var in_game_pause = IN_GAME_PAUSE.instantiate()
	add_child(in_game_pause)
	
