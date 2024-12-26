extends CanvasLayer

@onready var progress_bar: ProgressBar = $Control/Panel/VBoxContainer/ProgressBar
@onready var music: AudioStreamPlayer = $"../music"
@onready var player: Player = $"../Player"
@onready var timer: Timer = $"../game_hud_pause/Timer"
@onready var enemy_spawner: Camera2D = $"../Player/EnemySpawner"

func _on_maze_generator_map_loaded() -> void:
	for i in range(101):
		await get_tree().create_timer(0.03).timeout
		progress_bar.value = i

	await get_tree().create_timer(2).timeout
	player.set_process(true)
	SceneManager.fade_in()
	music.play()
	timer.start()
	queue_free()
