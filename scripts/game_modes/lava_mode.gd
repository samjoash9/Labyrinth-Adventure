extends Node2D

@onready var maze_generator: TileMapLayer = $Maze_Generator

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	maze_generator.init_maze()
	var start_tile = Vector2(200, 200)
