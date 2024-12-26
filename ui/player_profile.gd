extends CanvasLayer

@onready var click_sound: AudioStreamPlayer2D = $click_sound

@onready var hero_image: Sprite2D = $Control/Panel/PanelContainer/VBoxContainer/PanelContainer/Body/Hero_Holder/hero_image
@onready var attack: Label = $Control/Panel/PanelContainer/VBoxContainer/PanelContainer/Body/Hero_Holder/HBoxContainer2/attack
@onready var health: Label = $Control/Panel/PanelContainer/VBoxContainer/PanelContainer/Body/Hero_Holder/HBoxContainer2/health
@onready var agility: Label = $Control/Panel/PanelContainer/VBoxContainer/PanelContainer/Body/Hero_Holder/HBoxContainer2/agility

const ROGUE = preload("res://assets/Images/rogue.jpg")
const KNIGHT = preload("res://assets/Images/knight.jpg")
const WIZARD = preload("res://assets/Images/wizard.jpg")

func _ready() -> void:
	# setting stats
	match GameManager.selected_hero:
		"rogue":
			hero_image.texture = ROGUE
			attack.text = GameManager.ROGUE.base_stats.attack
			health.text = GameManager.ROGUE.base_stats.health
			agility.text = GameManager.ROGUE.base_stats.agility
		"knight":
			hero_image.texture = KNIGHT
			attack.text = GameManager.KNIGHT.base_stats.attack
			health.text = GameManager.KNIGHT.base_stats.health
			agility.text = GameManager.KNIGHT.base_stats.agility
		"wizard":
			hero_image.texture = WIZARD
			attack.text = GameManager.WIZARD.base_stats.attack
			health.text = GameManager.WIZARD.base_stats.health
			agility.text = GameManager.WIZARD.base_stats.agility
	
func _on_exit_pressed() -> void:
	click_sound.play()
	get_parent().visible = true
	
	# set player process back
	if get_parent().get_parent().get_node("Player"):
		get_parent().get_parent().get_node("Player").set_process(true)
		
	queue_free()
