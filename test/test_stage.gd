extends Node2D

var TEST_KNIGHT = preload("res://test/testKnight.tres")

func _ready() -> void:
	TEST_KNIGHT.basicStats.AttackPower+=10
	print(TEST_KNIGHT.basicStats.AttackPower)
	ResourceSaver.save(TEST_KNIGHT, "res://test/testKnight.tres")
