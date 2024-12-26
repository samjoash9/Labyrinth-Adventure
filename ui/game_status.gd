extends CanvasLayer

@onready var click_sound: AudioStreamPlayer2D = $"../click_sound"
@onready var score: Label = $Control/MarginContainer/Panel/PanelContainer/VBoxContainer/score

@onready var coins: Label = $Control/MarginContainer/Panel/PanelContainer/VBoxContainer/coins



func _on_restart_pressed() -> void:
	click_sound.play()
	SceneManager.fade_in()
	get_tree().reload_current_scene()
	visible = false

func _on_quit_pressed() -> void:
	click_sound.play()
	SceneManager.change_scene(
	"res://ui/map.tscn",
  { "pattern": "scribbles", "pattern_leave": "scribbles"})


func _on_coins_visibility_changed() -> void:
	coins.text = "COINS EARNED: " + str(GameManager.coins)
	score.text = "SCORE: " + str(GameManager.score)
	
