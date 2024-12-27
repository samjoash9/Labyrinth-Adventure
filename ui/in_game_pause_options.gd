extends CanvasLayer

const OPTIONS = preload("res://scenes/UI/options.tscn")
@onready var exit_modal: CanvasLayer = $exit_modal
var spawner: EnemySpawner
@onready var click_sound: AudioStreamPlayer2D = $click_sound

func _ready() -> void:
	await get_tree().create_timer(1)
	var enemies = get_tree().get_nodes_in_group("enemy")
	
	for e in enemies:
		e.set_process(false)
		
func _on_resume_pressed() -> void:
	spawner.timer.paused = false
	click_sound.play()
	# get player reference
	if get_parent().get_parent().get_node("Player"):
		var player = get_parent().get_parent().get_node("Player")
		var player_hud = player.get_node("HUD")

		player_hud.visible = true
		player.set_process(true)
		
		get_parent().get_node("Timer").paused = false
		get_parent().visible = true
	
	# get enemies
	var enemies = get_tree().get_nodes_in_group("enemy")
	
	for e in enemies:
		e.set_process(true)
	
	visible = false

func _on_restart_pressed() -> void:
	click_sound.play()
	SceneManager.fade_in()
	get_tree().reload_current_scene()
	visible = false

func _on_settings_pressed() -> void:
	click_sound.play()
	var settings = OPTIONS.instantiate()
	add_child(settings)
	visible = false

func _on_exit_game_pressed() -> void:
	click_sound.play()
	visible = false
	exit_modal.visible = true
