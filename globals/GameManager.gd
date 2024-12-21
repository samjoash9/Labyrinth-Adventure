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


# Player Manager

# Level Up Function

const UpgradePath: String = "res://upgrades/"


var ExpPoints: float = 0
var LevelExpCap : float = 100
var level: int = 0

func levelUP():
	ExpPoints -= LevelExpCap
	LevelExpCap += LevelExpCap*.2
	level += 1

var upgrades: Dictionary = {
	"ice_spike": "res://upgrades/ice_spike/ice_spike.tscn",
	"fire_ball" : "res://upgrades/fireball/fire_ball.tscn",
	"plant_spike" : "res://upgrades/plant_spike/plant_spike.tscn",
	"kunai" : "res://upgrades/kunai/kunai.tscn"
}

var availableUpgrades := ["ice_spike", "fire_ball" , "plant_spike" , "kunai"]

# Character Selection Function
var selected : String = "knight"

func get_selected_character():
	return ("res://resources/jobs/%s.tres" % selected)
	
func get_availableUpgrades() :
	var available:= []
	var player: playerCharacter = get_tree().get_first_node_in_group("player")
	for upgrade in player.applied_upgrades.get_children():
		if upgrade.upgradeInfo.level < 5 and upgrade.upgradeInfo.name.to_camel_case():
			available.append(upgrade)
	return available
