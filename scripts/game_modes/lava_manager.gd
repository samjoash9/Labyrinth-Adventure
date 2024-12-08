extends Node2D

@onready var lava_maze: TileMapLayer = $lava_maze
@onready var lava_objects: TileMapLayer = $lava_objects

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lava_maze.init_maze()
	lava_objects.init_objects()

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
