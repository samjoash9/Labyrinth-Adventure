extends Node2D

@onready var player: Player = $Player
@onready var game_over: CanvasLayer = $game_over
@onready var enemy_spawner: Camera2D = $Player/EnemySpawner
@onready var game_hud_pause: CanvasLayer = $game_hud_pause
@onready var portal_success_sound: AudioStreamPlayer2D = $portal_success_sound
@onready var music: AudioStreamPlayer = $music
@onready var game_complete: CanvasLayer = $game_complete

var dedicated_sizes = [
	1, 2, 2, 3, 4, 4, 5, 5, 6, 7
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var start_tile = Vector2(220, 245)
	player.position = start_tile
	player.set_process(false)

	# SETTING CAMERA LIMITS BASED ON GM
	enemy_spawner.limit_left = 0
	enemy_spawner.limit_top = 0
	enemy_spawner.limit_bottom = GameManager.map_rooms * 27 * 16
	enemy_spawner.limit_right = GameManager.map_rooms * 27 * 16
	
	print(GameManager.selected_level)

func _on_area_2d_body_entered(_body: Player) -> void:
	game_complete.visible = true
	portal_success_sound.play()
	music.stop()
	game_hud_pause.visible = false
	player.get_node("HUD").visible = false
	player.set_process(false)

	# set level in advance
	if GameManager.selected_level >= 1 and GameManager.selected_level <= 5 or GameManager.selected_level >= 7 and GameManager.selected_level <= 11:
		GameManager.selected_level += 1
		GameManager.dedicated_size = dedicated_sizes[GameManager.selected_level - 1]
		GameManager.map_rooms = GameManager.dedicated_size + 1
		GameManager.mapSize = GameManager.map_rooms * GameManager.PATTERN_SIZE
		GameManager.object_map_size = GameManager.mapSize - GameManager.PATTERN_SIZE
	
	# set mode
	if GameManager.selected_level == 6: 
		GameManager.selected_mode = "green_boss"
	elif  GameManager.selected_level == 12:
		GameManager.selected_mode = "dungeon_boss"
	elif GameManager.selected_level >= 1 and GameManager.selected_level <= 5:
		GameManager.selected_mode = "green"
	elif GameManager.selected_level >= 7 and GameManager.selected_level <= 11:
		GameManager.selected_mode = "dungeon"
	
