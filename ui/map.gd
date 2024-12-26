extends Node2D

@onready var camera: Camera2D = $Camera
@onready var map_confirm: CanvasLayer = $map_confirm
@onready var return_hud: CanvasLayer = $return_hud

const GREEN_MODE = preload("res://scenes/game_modes/Green_Mode.tscn")

@onready var click_sound: AudioStreamPlayer2D = $click_sound

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_UP:
		camera.position.y -= 15
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
		camera.position.y += 15

func _on_return_button_pressed() -> void:
	click_sound.play()
	SceneManager.change_scene(
	"res://scenes/central_hub.tscn",
  { "pattern": "scribbles", "pattern_leave": "scribbles"})

func confirmation(mode: String, level: int, size: int):
	click_sound.play()
	GameManager.selected_level = level
	GameManager.dedicated_size = size
	GameManager.selected_mode = mode
	
	map_confirm.visible = true
	return_hud.visible = false

func _on_confirm_pressed() -> void:
	click_sound.play()
	# generate level based on pressed level
	GameManager.map_rooms = GameManager.dedicated_size + 1
	GameManager.mapSize = GameManager.map_rooms * GameManager.PATTERN_SIZE
	GameManager.object_map_size = GameManager.mapSize - GameManager.PATTERN_SIZE
	
	print(GameManager.map_rooms)
	
	match GameManager.selected_mode:
		"green":
			SceneManager.change_scene(
			"res://scenes/game_modes/Green_Mode.tscn",
		  { "pattern": "scribbles", "pattern_leave": "scribbles"})
		"dungeon":
			SceneManager.change_scene(
			"res://scenes/game_modes/Dungeon_mode.tscn",
		  { "pattern": "scribbles", "pattern_leave": "scribbles"})
		"lava":
			SceneManager.change_scene(
			"res://scenes/game_modes/Lava_mode.tscn",
		  { "pattern": "scribbles", "pattern_leave": "scribbles"})

func _on_cancel_pressed() -> void:
	click_sound.play()
	map_confirm.visible = false
	return_hud.visible = true

func _on_level_1_pressed() -> void:
	confirmation("green", 1, 1)

func _on_level_2_pressed() -> void:
	confirmation("green", 2, 2)

func _on_level_3_pressed() -> void:
	confirmation("green", 3, 2)

func _on_level_4_pressed() -> void:
	confirmation("green", 4, 3)

func _on_level_5_pressed() -> void:
	confirmation("green", 5, 4)

func _on_level_6_pressed() -> void:
	confirmation("dungeon", 7, 4)

func _on_level_7_pressed() -> void:
	confirmation("dungeon", 8, 5)

func _on_level_8_pressed() -> void:
	confirmation("dungeon", 9, 5)

func _on_level_9_pressed() -> void:
	confirmation("dungeon", 10, 6)
	
func _on_level_10_pressed() -> void:
	confirmation("dungeon", 11, 7)

# COMMING SOON...

func _on_level_11_pressed() -> void:
	confirmation("lava", 11, 10)

func _on_level_12_pressed() -> void:
	confirmation("lava", 12, 10)
	
func _on_level_13_pressed() -> void:
	confirmation("lava", 13, 11)
	
func _on_level_14_pressed() -> void:
	confirmation("lava", 14, 11)
	
func _on_level_15_pressed() -> void:
	confirmation("lava", 15, 12)
