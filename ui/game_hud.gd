extends Control
@onready var exp_bar: ProgressBar = $MarginContainer/HBoxContainer/VBoxContainer/ExpBar
@onready var score_label: Label = $"MarginContainer/HBoxContainer/VBoxContainer/score label"



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	exp_bar.max_value = GameManager.LevelExpCap
	exp_bar.value = GameManager.ExpPoints
	score_label.text = "Level: " + str(GameManager.level)
	
	if exp_bar.value >= exp_bar.max_value:
		GameManager.levelUP()
	
