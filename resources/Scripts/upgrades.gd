extends Resource
class_name UpgradeResource

const upgradesPath: String = "res://upgrades/"
const projectilePath: String = "res://upgrades/projectiles/"

@export var name : String
@export var description: Array[String]
@export var icon : Texture2D
@export var level : int
@export var is_piercing: bool
@export var is_projectile: bool
@export var attackSpeed: float
@export var attackDamage : float
@export var attackCoolDown: float
@export var dependencies: Array[String]

func get_projectile_path():
	return projectilePath + str(name).to_snake_case() + ".tscn"
