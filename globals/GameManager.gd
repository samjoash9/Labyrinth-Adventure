extends Node

# MAP VARIABLES ==============================
const PATTERN_SIZE = 27
const map_rooms = 10
const mapSize = map_rooms * PATTERN_SIZE
const object_map_size = mapSize - PATTERN_SIZE

# SPECIFIC MAP TYPES
# GREEN 
const GREEN = {
	"atlas_id": 3, # atlas id for wall tiles
	"objects_id": 1, # atlas id for object tiles
	"ground_id": 0, # atlas id for ground tiles
	"ground_tiles": [ # tiles for ground
		Vector2i(2, 11),
		Vector2i(3, 11),
		Vector2i(0, 12),
		Vector2i(0, 12),
		Vector2i(0, 12),
		Vector2i(0, 12),
		Vector2i(1, 12),
		Vector2(2, 12),
		Vector2i(3, 12),
		Vector2i(4, 12)
	],
	"object_pattern_count": 16
}
# DUNGEON
const DUNGEON = {
	"atlas_id": 0, # atlas id for wall tiles
	"objects_id": 0, # atlas id for object tiles
	"ground_id": 0, # atlas id for ground tiles
	"ground_tiles": [ # tiles for ground
		Vector2i(0, 9),
		Vector2i(1, 9),
		Vector2i(2, 9), 
		Vector2i(0, 10),
		Vector2i(1, 10),
		Vector2i(2, 10),
		Vector2i(1, 11),
		Vector2(0, 11),
		Vector2i(1, 11),
		Vector2i(2, 11),
		Vector2(1, 0),
		Vector2i(9, 8),
		Vector2i(11, 8),
		Vector2(11, 9),
		Vector2i(10, 11),
		Vector2i(10, 11),
	],
	"object_pattern_count": 12
}
# LAVA
const LAVA = {
	"atlas_id": 3, # atlas id for wall tiles
	"objects_id": 0, # atlas id for object tiles
	"ground_id": 0, # atlas id for ground tiles
	"ground_tiles": [ # tiles for ground
		Vector2i(1, 2),
		Vector2i(4, 2),
		Vector2i(2, 2),
		Vector2i(4, 2),
		Vector2i(4, 2),
		Vector2i(4, 1),
		Vector2i(4, 2),
		Vector2i(5, 1),
		Vector2i(4, 2),
		Vector2i(4, 2),
		Vector2i(4, 2),
	],
	"object_pattern_count": 8
}


func _ready() -> void:
	print(get_tree().get_nodes_in_group("player"))
