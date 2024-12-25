extends CanvasLayer

const OPTIONS = preload("res://scenes/UI/options.tscn")
@onready var exit_modal: CanvasLayer = $exit_modal

@onready var click_sound: AudioStreamPlayer2D = $click_sound

func _on_resume_pressed() -> void:
	click_sound.play()
	# get player reference
	if get_parent().get_parent().get_node("Player"):
		var player = get_parent().get_parent().get_node("Player")
		var player_hud = player.get_node("HUD")
		player_hud.visible = true
		player.set_process(true)
		get_parent().visible = true
	
	visible = false

func _on_restart_pressed() -> void:
	click_sound.play()
	if GameManager.selected_mode and GameManager.selected_level:
		match GameManager.selected_mode:
			"green":
				SceneManager.change_scene(
				"res://scenes/game_modes/Green_Mode.tscn",
			  { "pattern": "scribbles", "pattern_leave": ""})
			"dungeon":
				SceneManager.change_scene(
				"res://scenes/game_modes/Dungeon_mode.tscn",
			  { "pattern": "scribbles", "pattern_leave": ""})
			"lava":
				SceneManager.change_scene(
				"res://scenes/game_modes/Lava_mode.tscn",
			  { "pattern": "scribbles", "pattern_leave": ""})

func _on_settings_pressed() -> void:
	click_sound.play()
	var settings = OPTIONS.instantiate()
	add_child(settings)
	visible = false

func _on_exit_game_pressed() -> void:
	click_sound.play()
	visible = false
	exit_modal.visible = true
