extends TileMapLayer

const PATTERN_SIZE = 16
const mapSize = 2 * PATTERN_SIZE
const atlas_id = 3

func init_objects():
	var prev = 0
	for x in range(-1*PATTERN_SIZE, mapSize + PATTERN_SIZE, PATTERN_SIZE):
		for y in range(-1*PATTERN_SIZE, mapSize + PATTERN_SIZE, PATTERN_SIZE):
			var pos = Vector2i(x, y)
			var pattern_index = generate_random_index(prev)
			print(pattern_index, prev)
			prev = pattern_index
			var pattern = TileMapPattern.new()
			pattern = tile_set.get_pattern(pattern_index)
			set_pattern(pos, pattern)

func generate_random_index(prev: int) -> int:
	var random_int = prev
	while true:
		random_int = randi_range(0, 7)
		if random_int != prev:
			break
	
	return random_int
