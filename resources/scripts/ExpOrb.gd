extends Pickables
class_name Exporb

@export var xpAmount: float

func activate():
	playerReference.exp += xpAmount
	
