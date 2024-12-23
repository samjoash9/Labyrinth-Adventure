extends TileMapLayer

@onready var loading_screen: CanvasLayer = $"../loading_screen"
@onready var progress_bar: ProgressBar = $"../loading_screen/Control/Panel/VBoxContainer/ProgressBar"

@export var wall_patterns: TileMapLayer
@export var maze_object_patterns: TileMapLayer
@export var mode: int

var atlas_id = 0
const PATTERN_SIZE = GameManager.PATTERN_SIZE
var mapSize = GameManager.mapSize
var object_map_size = GameManager.object_map_size
var noise_tiles = []
var object_pattern_count = 0

signal map_loaded

# THREADS
var thread1: Thread
var thread2: Thread

func _ready() -> void:
	match mode:
		1:
			atlas_id = GameManager.GREEN["atlas_id"]
			noise_tiles = GameManager.GREEN["ground_tiles"]
			object_pattern_count = GameManager.GREEN["object_pattern_count"]
		2:
			atlas_id = GameManager.DUNGEON["atlas_id"]
			noise_tiles = GameManager.DUNGEON["ground_tiles"]
			object_pattern_count = GameManager.DUNGEON["object_pattern_count"]
		3: 
			atlas_id = GameManager.LAVA["atlas_id"]
			noise_tiles = GameManager.LAVA["ground_tiles"]
			object_pattern_count = GameManager.LAVA["object_pattern_count"]
		_:
			atlas_id = 0
			noise_tiles = 0
			object_pattern_count = 0

	thread1 = Thread.new()
	thread2 = Thread.new()
	
	thread1.start(apply_noise)
	thread2.start(init_objects)
	
	thread1.wait_to_finish()
	thread2.wait_to_finish()
	
	await init_maze()
	progress_bar.value = 100
	emit_signal("map_loaded")

const N = 1 
const E = 2
const S = 4
const W = 8

var cell_walls = {
	Vector2i(0,-1): N, 
	Vector2i(1,0): E, 
	Vector2i(0,1): S, 
	Vector2i(-1,0): W
}

func init_maze():
	var patterns = {}
	var unvisited = []
	var stack = []

	# Initialize patterns and unvisited list
	for x in range(0, mapSize, PATTERN_SIZE):
		for y in range(0, mapSize, PATTERN_SIZE):
			unvisited.append(Vector2i(x, y))
			var key = Vector2i(x, y)
			patterns[key] = 15
	
	var iterations = len(unvisited) + 1
	var i = 0

	var current = Vector2i(0, 0)
	unvisited.erase(current) 

	while unvisited.size() > 0:
		var adjacent_cells = check_adjacent(current, unvisited)
		
		if adjacent_cells.size() > 0:
			# Choose a random adjacent cell
			var next = adjacent_cells[randi() % adjacent_cells.size()]
			stack.append(current)  # Push current to stack
			
			# Calculate direction and update walls
			var dir = (next - current) / PATTERN_SIZE
			var current_walls = patterns.get(current) - cell_walls[dir]
			var next_walls = patterns.get(next) - cell_walls[-dir]

			# Apply wall updates
			patterns[current] = current_walls
			patterns[next] = next_walls
			apply_pattern_by_index(current, current_walls)
			apply_pattern_by_index(next, next_walls)

			# Move to the next cell
			current = next
			unvisited.erase(current)  
		else:
			# Backtrack
			if stack.size() > 0:
				current = stack.pop_back()
			else:
				break 
		i += 1
		progress_bar.value = ((float(i) / iterations) * 100)

func apply_noise():
	var length = len(noise_tiles) - 1 
	for x in range(mapSize):
		for y in range(mapSize):
			wall_patterns.set_cell(Vector2i(x, y), atlas_id, noise_tiles[randi_range(0, length)])

func apply_pattern_by_index(pos: Vector2i, pattern_index: int):
	var pattern = TileMapPattern.new()
	pattern = wall_patterns.tile_set.get_pattern(pattern_index)
	wall_patterns.set_pattern(pos, pattern)

func check_adjacent(cell, unvisited):
	var available_cells = []
	for dir in cell_walls.keys():
		if cell+(dir*PATTERN_SIZE) in unvisited:
			available_cells.append(cell+dir*PATTERN_SIZE)
	return available_cells

func init_objects():
	var prev = 0
	for x in range(0, object_map_size + PATTERN_SIZE, PATTERN_SIZE):
		for y in range(0, object_map_size + PATTERN_SIZE, PATTERN_SIZE):
			var pos = Vector2i(x, y)
			var pattern_index = generate_random_index(prev)
			prev = pattern_index
			var pattern = TileMapPattern.new()
			pattern = maze_object_patterns.tile_set.get_pattern(pattern_index)
			maze_object_patterns.set_pattern(pos, pattern)

func generate_random_index(prev: int) -> int:
	var random_int = prev
	while random_int == prev:
		random_int = randf_range(0, object_pattern_count-1)
	
	return random_int
