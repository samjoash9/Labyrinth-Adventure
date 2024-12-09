extends Node2D

@onready var green_objects: TileMapLayer = $green_objects
@onready var green_maze: TileMapLayer = $green_maze

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	green_objects.init_objects()
	green_maze.init_maze()
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
