extends Resource
class_name Enemy

@export var name: String
@export var animation: SpriteFrames
@export var hitPoints: float
@export var movementSpeed: float
@export var damage: float
@export var attackRadius: float
@export var attackSpeed: float
@export var drops: Dictionary
@export var scoreValue: int
enum attackTypes{
	MELEE,
	RANGED
}
@export var attackType : attackTypes

func get_drop():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	var weigthed_sum = 0
	
	for n in drops:
		weigthed_sum += drops[n]
	
	var item = rng.randi_range(0,weigthed_sum)
	
	for n in drops:
		if item <= drops[n]:
			return n
		else:
			item -= drops[n]
