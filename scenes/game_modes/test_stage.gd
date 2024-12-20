extends Node2D
const AKANAME = preload("res://enemies/dungeon/akaname/akaname.tscn")

@export var upgradeInfo: UpgradeInfo = preload("res://resources/upgrades/Fireball.tres")

func _ready() -> void:
	print(upgradeInfo.levelDescriptions)

func _on_timer_timeout() -> void:
	add_child(AKANAME.instantiate())


func _on_look_timer_timeout() -> void:
	pass # Replace with function body.
