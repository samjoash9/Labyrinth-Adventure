extends CanvasLayer

@onready var player_hud: CanvasLayer = $"../Player/HUD"
@onready var player: Player = $"../Player"
@onready var timer_label: Label = $Control/MarginContainer/HBoxContainer/timer_label
@onready var timer: Timer = $Timer

const IN_GAME_PAUSE = preload("res://ui/in_game_pause.tscn")

func _on_button_pressed() -> void:
	get_parent().get_node("click_sound").play()
	player.set_process(false)
	player_hud.visible = false
	visible = false
	timer.paused = true

	var in_game_pause = IN_GAME_PAUSE.instantiate()
	add_child(in_game_pause)

func _process(delta: float) -> void:
	timer_label.text = "TIME: " + str(int(timer.time_left))
