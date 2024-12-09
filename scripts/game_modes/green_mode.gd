extends Node2D

@onready var maze_generator: TileMapLayer = $Maze_Generator

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	maze_generator.init_maze()
