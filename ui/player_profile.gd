extends CanvasLayer

@onready var click_sound: AudioStreamPlayer2D = $click_sound
@onready var hero_image: Sprite2D = $Control/Panel/PanelContainer/VBoxContainer/Body/Sprite_container/hero_image

const ROGUE = preload("res://assets/Images/rogue.jpg")
const KNIGHT = preload("res://assets/Images/knight.jpg")
const WIZARD = preload("res://assets/Images/wizard.jpg")

func _ready() -> void:
	# setting character profile picture
	match GameManager.selected_hero:
		"rogue":
			hero_image.texture = ROGUE
		"knight":
			hero_image.texture = KNIGHT
		"wizard":
			hero_image.texture = WIZARD
	
func _on_exit_pressed() -> void:
	click_sound.play()
	get_parent().visible = true
	
	# set player process back
	if get_parent().get_parent().get_node("Player"):
		get_parent().get_parent().get_node("Player").set_process(true)
	queue_free()
