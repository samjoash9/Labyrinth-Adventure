extends TileMapLayer

const PATTERN_SIZE = 16
const mapSize = 3 * PATTERN_SIZE
const atlas_id = 3

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

var noise_tiles = [
	Vector2i(1, 2),
	Vector2i(2, 2),
	Vector2i(4, 1),
	Vector2i(5, 1),
	Vector2i(4, 2),
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_init_maze()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _init_maze():
	apply_noise()
	#mazeOutline()

	var patterns = {}
	var unvisited = []
	var stack = []
	for x in range(0 , mapSize, PATTERN_SIZE):
		for y in range(0 , mapSize, PATTERN_SIZE):
			unvisited.append(Vector2i(x,y))
			var key = Vector2i(x, y)
			patterns[key] = 15
	
	var current = Vector2i(0,0)
	unvisited.erase(current)
	
	while unvisited:
		var adjacent_cells = check_adjacent(current, unvisited)
		
		if adjacent_cells.size()>0:
			var next = adjacent_cells[randi() % adjacent_cells.size()]
			stack.append(current)
			var dir = next - current
			 
			var current_walls = patterns.get(current) - cell_walls[dir/PATTERN_SIZE]
			var next_walls = patterns.get(next) - cell_walls[-dir/PATTERN_SIZE] 
			
			patterns[current] = current_walls
			patterns[next] = next_walls
			
			apply_pattern_by_index(next, next_walls)
			apply_pattern_by_index(current, current_walls)
			current = next
			unvisited.erase(current)
		else:
			current = stack.pop_back()
	
func mazeOutline():
	apply_pattern_by_index(Vector2i(-16,-16), N|E|S|W)
	apply_pattern_by_index(Vector2i(0,-16), N|E|S|W)
	apply_pattern_by_index(Vector2i(-16,0), N|E|S|W)
	for x in range(-1*PATTERN_SIZE, mapSize + PATTERN_SIZE, PATTERN_SIZE):
		for y in range(-1*PATTERN_SIZE, mapSize + PATTERN_SIZE, PATTERN_SIZE):
			apply_pattern_by_index(Vector2i(x,y), N|E|S|W)

func apply_noise():
	for x in range(mapSize):
		for y in range(mapSize):
			set_cell(Vector2i(x, y), atlas_id, noise_tiles[randi_range(0, len(noise_tiles)-1)])

func apply_pattern_by_index(pos: Vector2i, pattern_index: int):
	var pattern = TileMapPattern.new()
	pattern = tile_set.get_pattern(pattern_index)
	set_pattern(pos, pattern)
	
func check_adjacent(cell, unvisited):
	var available_cells = []
	for dir in cell_walls.keys():
		if cell+(dir*PATTERN_SIZE) in unvisited:
			available_cells.append(cell+dir*PATTERN_SIZE)
	return available_cells
