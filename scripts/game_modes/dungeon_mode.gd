extends Node2D

@onready var player: Player = $Player
@onready var camera_2d: Camera2D = $Player/PlayerBodyCollision/Camera2D

const DUNGEON_PORTAL = preload("res://scenes/portals/dungeon_portal.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var start_tile = Vector2(220, 245)
	player.position = start_tile

	# SETTING CAMERA LIMITS BASED ON GM
	camera_2d.limit_left = 0
	camera_2d.limit_top = 0
	camera_2d.limit_bottom = GameManager.map_rooms * 27 * 16
	camera_2d.limit_right = GameManager.map_rooms * 27 * 16

func _on_maze_generator_last_index(portal_position: Vector2i) -> void:
	var dungeon_portal = DUNGEON_PORTAL.instantiate()
	add_child.call_deferred(dungeon_portal)
	dungeon_portal.z_index = 100
	dungeon_portal.scale.x = 0.8
	dungeon_portal.scale.y = 0.8
	dungeon_portal.position = portal_position
