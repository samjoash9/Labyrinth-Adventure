extends CanvasLayer

@onready var click_sound: AudioStreamPlayer2D = $"../click_sound"
#@onready var score: Label = $Control/MarginContainer/Panel/PanelContainer/VBoxContainer/score
#@onready var coins: Label = $Control/MarginContainer/Panel/PanelContainer/VBoxContainer/coins
@onready var score: Label = $Control/MarginContainer/Panel/PanelContainer/VBoxContainer/score

func _process(delta: float) -> void:
	if get_tree().get_first_node_in_group("player") != null and get_tree().get_first_node_in_group("player").state == 2:
		score.text = "Score: " + str(GameManager.score)
		self.show()

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
