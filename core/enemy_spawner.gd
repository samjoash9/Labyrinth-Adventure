extends Camera2D

const ENEMY = preload("res://core/Enemies/enemy.tscn")
@export var world: Node2D
@onready var timer: Timer = $Timer
@onready var label: Label = $CanvasLayer/Label

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
	
func spawn(is_elite: bool):
	if get_tree().get_node_count_in_group("enemy") < 400:
		var enemyInstance: BaseEnemy = ENEMY.instantiate()
		var enemyResource: Enemy = spawnable.pick_random()
		enemyInstance.enemyType = enemyResource
		enemyInstance.global_position = get_random_position()
		world.add_child(enemyInstance)
		if is_elite:
			enemyInstance.damage *= 2
			enemyInstance.hitPoints *=2
			enemyInstance.scale *= Vector2(2,2)	
			#enemyInstance.sprite_frames.material = load("res://shaders/elite.tres")
	else:
		return
		
func _on_timer_timeout() -> void:
	elapsedTime += 1
	label.text = format_time(elapsedTime)
	spawn_wave((elapsedTime/60.00)+1)
	#spawn_wave(20)
#	Spawn Wave Every Minute
	if elapsedTime % 30 == 0:
		spawn_wave(elapsedTime/10.00)
	if elapsedTime % 60 == 0:
		for i in range(elapsedTime%30):
			spawn(true)
#	Introduce New Enemy Evey 2 minutes and increase enemy stats by 20%
	if elapsedTime %30== 0:
		if waveLevel < enemy_types.size()-1:
			waveLevel+=1
			spawnable.append(enemy_types[waveLevel])

func spawn_wave(amount: float):
	for i in range(amount):
		spawn(false)
