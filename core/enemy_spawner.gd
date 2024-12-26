extends Camera2D

const ENEMY = preload("res://core/Enemies/enemy.tscn")
@export var world: Node2D
@onready var timer: Timer = $Timer
@onready var label: Label = $CanvasLayer/Label

var valid_ids: Array
var wall_type: TileMapLayer

func get_random_position() ->Vector2:
	%Path2D.scale = Vector2(randf_range(.5,1),randf_range(.5,1))
	%PathFollow2D.progress_ratio = randf()
	return %PathFollow2D.global_position

var elapsedTime: int
var waveLevel = 0
var enemyWaveMultiplier = 1
@export var enemy_types : Array[Enemy]

func format_time(time: float) -> String:
	var minutes = (time) / 60.00
	var seconds = int(time) % 60
	return "Time: %02d:%02d" % [minutes , seconds]

var spawnable = []

func _ready() -> void:
	spawnable.append(enemy_types[waveLevel])
	
	# get tile ids
	match GameManager.selected_mode:
		"green":
			valid_ids = GameManager.GREEN.ground_tiles
			wall_type = get_parent().get_parent().get_node("green_walls")
		"dungeon":
			valid_ids = GameManager.DUNGEON.ground_tiles
			wall_type = get_parent().get_parent().get_node("dungeon_walls")

func spawn():
	if get_tree().get_node_count_in_group("enemy") < 400:
		var enemyInstance: BaseEnemy = ENEMY.instantiate()
		var enemyResource: Enemy = spawnable.pick_random()
		enemyInstance.enemyType = enemyResource
		enemyInstance.global_position = random_position()
		world.add_child(enemyInstance)
	else:
		return

func random_position() -> Vector2:
	var spawnable_position: Vector2
	
	while true:
		var pos = get_random_position()
		var tile = wall_type.local_to_map(pos)
		var tile_id = wall_type.get_cell_atlas_coords(tile)
		
		if tile_id in valid_ids:
			spawnable_position = pos
			break
		
	return spawnable_position

func _on_timer_timeout() -> void:
	elapsedTime += 1
	label.text = format_time(elapsedTime)
	spawn_wave((elapsedTime/60.00)+1)
	#spawn_wave(20)
#	Spawn Wave Every Minute
	if elapsedTime % 60 == 0:
		spawn_wave(elapsedTime/10.00)
#	Introduce New Enemy Evey 2 minutes and increase enemy stats by 20%
	if elapsedTime %120 == 0:
		if waveLevel < enemy_types.size()-1:
			waveLevel+=1
			spawnable.append(enemy_types[waveLevel])

func spawn_wave(amount: float):
	for i in range(amount):
		spawn()
