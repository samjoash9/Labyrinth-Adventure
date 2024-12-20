extends Resource

@export var AvailableUpgrades: Array[Resource]

func get_random():
	AvailableUpgrades.pick_random()
