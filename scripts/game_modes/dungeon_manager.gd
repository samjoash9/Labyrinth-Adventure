extends Node2D

@onready var objects = $objects
@onready var dungeon_maze: TileMapLayer = $dungeon_maze

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dungeon_maze.init_maze()
	objects.init_objects()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
