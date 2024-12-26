extends Node2D

@onready var player: Player = $Player
@onready var game_status: CanvasLayer = $game_status
@onready var dungeon_portal: AnimatedSprite2D = %dungeon_portal
@onready var game_hud_pause: CanvasLayer = $game_hud_pause
@onready var portal_success_sound: AudioStreamPlayer2D = $portal_success_sound
@onready var music: AudioStreamPlayer = $music
@onready var game_complete: CanvasLayer = $game_complete
@onready var enemy_spawner: Camera2D = $Player/EnemySpawner

var user_prefs: UserPreferences

var dedicated_sizes = [
	1, 2, 2, 3, 4, 0, 4, 5, 5, 6, 7, 0
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

func _on_area_2d_body_entered(_body: Player) -> void:
	game_complete.visible = true
	music.stop()
	portal_success_sound.play()
	game_hud_pause.visible = false
	player.get_node("HUD").visible = false
	player.set_process(false)

	user_prefs = UserPreferences.load_or_create()

	# set level in advance
	if GameManager.selected_level >= 1 and GameManager.selected_level <= 5 or GameManager.selected_level >= 7 and GameManager.selected_level <= 11:
		GameManager.selected_level += 1
		GameManager.dedicated_size = dedicated_sizes[GameManager.selected_level - 1]
		GameManager.map_rooms = GameManager.dedicated_size + 1
		GameManager.mapSize = GameManager.map_rooms * GameManager.PATTERN_SIZE
		GameManager.object_map_size = GameManager.mapSize - GameManager.PATTERN_SIZE
		user_prefs.unlocked_levels += 1
	
	# set mode
	if GameManager.selected_level == 6: 
		GameManager.selected_mode = "green_boss"
	elif  GameManager.selected_level == 12:
		GameManager.selected_mode = "dungeon_boss"
	elif GameManager.selected_level >= 1 and GameManager.selected_level <= 5:
		GameManager.selected_mode = "green"
	elif GameManager.selected_level >= 7 and GameManager.selected_level <= 11:
		GameManager.selected_mode = "dungeon"
	
	user_prefs.save()
extends Node2D

@onready var player: Player = $Player
@onready var enemy_spawner: Camera2D = $Player/EnemySpawner
@onready var game_status: CanvasLayer = $game_status
@onready var dungeon_portal: AnimatedSprite2D = %dungeon_portal
@onready var game_hud_pause: CanvasLayer = $game_hud_pause
@onready var portal_success_sound: AudioStreamPlayer2D = $portal_success_sound
@onready var music: AudioStreamPlayer = $music
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

func _on_area_2d_body_entered(body: Player) -> void:
	game_status.visible = true
	music.stop()
	portal_success_sound.play()
	game_hud_pause.visible = false
	player.get_node("HUD").visible = false
	player.set_process(false)
	

func _on_game_status_visibility_changed() -> void:
	pass # Replace with function body.
