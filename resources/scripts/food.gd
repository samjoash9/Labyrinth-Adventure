extends Pickables
class_name Food

@export var heal: float

func activate():
	playerReference.hitPoints += heal
