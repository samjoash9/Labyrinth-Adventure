extends Camera2D

const ENEMY = preload("res://core/Enemies/enemy.tscn")
@export var world: Node2D
@onready var timer: Timer = $Timer
@onready var label: Label = $CanvasLayer/Label

func get_random_position() ->Vector2:
	var viewportsize = self.get_viewport_rect().size / self.zoom
	var worldPos = get_viewport().get_camera_2d().make_canvas_position_local(Vector2((randf() * viewportsize.x),(randf() * viewportsize.y)))
	return worldPos

var elapsedTime: int
var waveLevel = 0
var enemyWaveMultiplier = 1
@export var enemy_types : Array[Enemy]

func format_time(time: float) -> String:
	var minutes = int(time) / 60
	var seconds = int(time) % 60
	return "Time: %02d:%02d" % [minutes , seconds]

var spawnable = []

func _ready() -> void:
	spawnable.append(enemy_types[waveLevel])
	
func spawn():
	if get_tree().get_node_count_in_group("enemy") < 400:
		var enemyInstance: BaseEnemy = ENEMY.instantiate()
		var enemyResource: Enemy = spawnable.pick_random()
		enemyInstance.enemyType = enemyResource
		enemyInstance.global_position = get_random_position()
		world.add_child(enemyInstance)
	else:
		return
		
func _on_timer_timeout() -> void:
	elapsedTime += 1
	label.text = format_time(elapsedTime)
	spawn_wave((elapsedTime/60)+1)
	#spawn_wave(20)
#	Spawn Wave Every Minute
	if elapsedTime % 60 == 0:
		spawn_wave(elapsedTime/10)
#	Introduce New Enemy Evey 2 minutes and increase enemy stats by 20%
	if elapsedTime %120 == 0:
		if waveLevel < enemy_types.size()-1:
			waveLevel+=1
			spawnable.append(enemy_types[waveLevel])

func spawn_wave(amount: int):
	for i in range(amount):
		spawn()
