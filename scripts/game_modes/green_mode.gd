extends Node2D

@onready var player: Player = $Player
@onready var camera_2d: Camera2D = $Player/PlayerBodyCollision/Camera2D

const GREEN_PORTAL = preload("res://scenes/portals/green_portal.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var start_tile = Vector2(220, 245)
	player.position = start_tile
	player.set_process(false)

	# SETTING CAMERA LIMITS BASED ON GM
	camera_2d.limit_left = 0
	camera_2d.limit_top = 0
	camera_2d.limit_bottom = GameManager.map_rooms * 27 * 16
	camera_2d.limit_right = GameManager.map_rooms * 27 * 16

func _on_maze_generator_last_index(portal_position: Variant) -> void:
	var green_portal = GREEN_PORTAL.instantiate()
	add_child.call_deferred(green_portal)
	green_portal.z_index = 12
	green_portal.scale.x = 0.8
	green_portal.scale.y = 0.8
	green_portal.position = portal_position
