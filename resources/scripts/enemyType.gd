extends Resource
class_name Enemy

@export var name: String
@export var animation: SpriteFrames
@export var hitPoints: float
@export var movementSpeed: float
@export var damage: float
@export var attackRadius: float
@export var attackSpeed: float
@export var drop: Array[Pickables]
enum attackTypes{
	MELEE,
	RANGED
}
@export var attackType : attackTypes
