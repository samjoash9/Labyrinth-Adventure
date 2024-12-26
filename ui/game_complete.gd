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
	# check current mode
	if GameManager.selected_level == 5:
		GameManager.selected_mode = "dungeon"
	
	# increment level
	if GameManager.selected_level >= 1 and GameManager.selected_level <= 9:
		GameManager.selected_level += 1
		GameManager.map_rooms = GameManager.selected_level + 1
		GameManager.mapSize = GameManager.map_rooms * GameManager.PATTERN_SIZE
		GameManager.object_map_size = GameManager.mapSize - GameManager.PATTERN_SIZE
	
	if GameManager.selected_level > 8:
		SceneManager.change_scene(
		"res://ui/map.tscn",
	  { "pattern": "scribbles", "pattern_leave": "scribbles"})
	else:
		# change scene
		match GameManager.selected_mode:
			"green":
				SceneManager.change_scene(
				"res://scenes/game_modes/Green_Mode.tscn",
			  { "pattern": "scribbles", "pattern_leave": "scribbles"})
			"dungeon":
				SceneManager.change_scene(
				"res://scenes/game_modes/Dungeon_mode.tscn",
			  { "pattern": "scribbles", "pattern_leave": "scribbles"})
