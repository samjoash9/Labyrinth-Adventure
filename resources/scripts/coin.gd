extends Pickables
class_name CoinPickable

@export var coinVal: int

func activate():
	GameManager.coins += coinVal