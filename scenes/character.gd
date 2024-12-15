extends Node2D

const characterClass : Dictionary = {
	"Knight": preload("res://scenes/Characters/Heroes/knight.tscn"),
	"Rouge" : preload("res://scenes/Characters/player.tscn")
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(characterClass["Knight"].instantiate())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
