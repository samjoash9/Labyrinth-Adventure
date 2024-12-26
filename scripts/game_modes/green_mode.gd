extends Node2D

@onready var player: Player = $Player
@onready var game_over: CanvasLayer = $game_over
@onready var enemy_spawner: Camera2D = $Player/EnemySpawner
@onready var game_hud_pause: CanvasLayer = $game_hud_pause
@onready var portal_success_sound: AudioStreamPlayer2D = $portal_success_sound
@onready var music: AudioStreamPlayer = $music
@onready var game_complete: CanvasLayer = $game_complete

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
	portal_success_sound.play()
	music.stop()
	game_hud_pause.visible = false
	player.get_node("HUD").visible = false
	player.set_process(false)
