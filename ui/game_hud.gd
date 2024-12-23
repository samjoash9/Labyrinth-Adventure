extends Control
@onready var exp_bar: ProgressBar = $MarginContainer/HBoxContainer/VBoxContainer/ExpBar
@onready var score_label: Label = $"MarginContainer/HBoxContainer/VBoxContainer/score label"
@onready var hp_bar: ProgressBar = $MarginContainer/HBoxContainer/VBoxContainer/HpBar

func _process(delta: float) -> void:
	hp_bar.value = get_tree().get_first_node_in_group("player").hurt_box.HITPOINTS
	exp_bar.max_value = GameManager.LevelExpCap
	exp_bar.value = GameManager.ExpPoints
	score_label.text = "Level: " + str(GameManager.level)
	if exp_bar.value >= exp_bar.max_value:
		GameManager.levelUP()
