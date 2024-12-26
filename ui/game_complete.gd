extends CanvasLayer

@onready var click_sound: AudioStreamPlayer2D = $"../click_sound"

func _on_restart_pressed() -> void:
	click_sound.play()
	SceneManager.fade_in()
	get_tree().reload_current_scene()
	visible = false

func _on_quit_pressed() -> void:
	click_sound.play()
	SceneManager.change_scene(
	"res://ui/map.tscn",
  { "pattern": "scribbles", "pattern_leave": "scribbles"})

func _on_next_level_pressed() -> void:
	print(GameManager.selected_mode)
	
	match GameManager.selected_mode:
		"green_boss":
			SceneManager.change_scene(
			"res://scenes/game_modes/green_boss_level.tscn",
		  { "pattern": "scribbles", "pattern_leave": "scribbles"})
		"dungeon_boss":
			SceneManager.change_scene(
			"res://scenes/game_modes/dungeon_boss_level.tscn",
		  { "pattern": "scribbles", "pattern_leave": "scribbles"})
		"green":
			SceneManager.change_scene(
				"res://scenes/game_modes/Green_Mode.tscn",
		  { "pattern": "scribbles", "pattern_leave": "scribbles"})
		"dungeon":
			SceneManager.change_scene(
			"res://scenes/game_modes/Dungeon_mode.tscn",
		  { "pattern": "scribbles", "pattern_leave": "scribbles"})
