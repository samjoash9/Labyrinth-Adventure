extends Resource
class_name UpgradeResource

const upgradesPath: String = "res://upgrades/"

@export var name : String
@export var description: Array[String]
@export var icon : Texture2D
@export var level : int
@export var is_piercing: bool
@export var attackSpeed: float
@export var attackCoolDown: float
@export var dependencies: Array[String]

func get_upgrades_path():
	return upgradesPath + str(name) + "tscn"
