extends CanvasLayer

@onready var click_sound: AudioStreamPlayer2D = $click_sound
@onready var hero_image: Sprite2D = $Control/Panel/PanelContainer/VBoxContainer/Body/Sprite_container/hero_image
@onready var attack: Label = $Control/Panel/PanelContainer/VBoxContainer/Body/HBoxContainer/VBoxContainer/attack
@onready var health: Label = $Control/Panel/PanelContainer/VBoxContainer/Body/HBoxContainer/VBoxContainer/health
@onready var agility: Label = $Control/Panel/PanelContainer/VBoxContainer/Body/HBoxContainer/VBoxContainer/agility

const ROGUE = preload("res://assets/Images/rogue.jpg")
const KNIGHT = preload("res://assets/Images/knight.jpg")
const WIZARD = preload("res://assets/Images/wizard.jpg")

func _ready() -> void:
	# setting stats
	match GameManager.selected_hero:
		"rogue":
			hero_image.texture = ROGUE
			attack.text = "150"
			health.text = "75"
			agility.text = "180"
		"knight":
			hero_image.texture = KNIGHT
			attack.text = "100"
			health.text = "150"
			agility.text = "100"
		"wizard":
			hero_image.texture = WIZARD
			attack.text = "200"
			health.text = "60"
			agility.text = "120"
	
func _on_exit_pressed() -> void:
	click_sound.play()
	get_parent().visible = true
	
	# set player process back
	if get_parent().get_parent().get_node("Player"):
		get_parent().get_parent().get_node("Player").set_process(true)
	queue_free()
