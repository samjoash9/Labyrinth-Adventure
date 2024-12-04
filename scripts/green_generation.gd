extends TileMapLayer


const PATTERN_SIZE = 16
const mapSize = 3 * PATTERN_SIZE

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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_init_maze()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _init_maze():
	mazeOutline()
	
	var unvisited = []
	var stack = []
	for x in range(0 , mapSize, PATTERN_SIZE):
		for y in range(0 , mapSize, PATTERN_SIZE):
			unvisited.append(Vector2i(x,y))
	print("unvisited: ", unvisited)
	
	var current = Vector2i(0,0)
	unvisited.erase(current)
	
	while unvisited:
		var adjacent_cells = check_adjacent(current, unvisited)
		
		print(adjacent_cells)
		
		if adjacent_cells.size()>0:
			var next = adjacent_cells[randi() % adjacent_cells.size()]
			stack.append(current)
			var dir = next - current
			print("direction: ", dir)
			
			# 1 ra pirme makuha sa get_cell_source_id kay wala may tiles 
			var current_walls = get_cell_source_id(current) - cell_walls[dir/PATTERN_SIZE]
			var next_walls = get_cell_source_id(next) - cell_walls[-dir/PATTERN_SIZE] 

			print(get_cell_atlas_coords(Vector2i(0, 0)))

			apply_pattern_by_index(current, current_walls)
			apply_pattern_by_index(next, next_walls)
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

func apply_pattern_by_index(pos: Vector2i, pattern_index: int):
	var pattern = TileMapPattern.new()
	pattern = tile_set.get_pattern(pattern_index)
	print(pattern_index)
	set_pattern(pos, pattern)
	
func check_adjacent(cell, unvisited):
	var available_cells = []
	for dir in cell_walls.keys():
		if cell+(dir*PATTERN_SIZE) in unvisited:
			available_cells.append(cell+dir*PATTERN_SIZE)
	return available_cells
