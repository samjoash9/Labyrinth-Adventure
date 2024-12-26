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
	
	# pause enemies
	var enemies = get_tree().get_nodes_in_group("enemy")
	
	for e in enemies:
		e.set_process(false)

	var in_game_pause = IN_GAME_PAUSE.instantiate()
	add_child(in_game_pause)

func _process(_delta: float) -> void:
	timer_label.text = "TIME: " + str(int(timer.time_left))
