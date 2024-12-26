extends Node

# MAP VARIABLES ==============================
const PATTERN_SIZE = 27
var map_rooms = 1
var mapSize = map_rooms * PATTERN_SIZE
var object_map_size = mapSize - PATTERN_SIZE

var user_prefs: UserPreferences
const defaultSize: Vector2i = Vector2i(640*2,360*2)
var maindisplaysize : Vector2i = DisplayServer.screen_get_size(0)

func _ready() -> void:
	user_prefs = UserPreferences.load_or_create()
	var bus_index_music = AudioServer.get_bus_index("Music")
	var bus_index_sound = AudioServer.get_bus_index("SoundFX")
	
	AudioServer.set_bus_volume_db(bus_index_music,linear_to_db(user_prefs.music_audio_level))
	AudioServer.set_bus_volume_db(bus_index_sound,linear_to_db(user_prefs.music_audio_level))

	match user_prefs.displaymode:
		2:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_size(defaultSize)
			DisplayServer.window_set_position((maindisplaysize-defaultSize)/2)
		1: 
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)

# CENTRAL HUB LAST POSITION
var central_hub_last_position: Vector2i = Vector2(216, 6)

# SELECTED HERO
var selected_hero = "rogue"

# SELECTED LEVEL
var selected_level = 1
var selected_mode = "green"

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

# IN GAME SCORE AND COINS
var score: int
var coins: int
