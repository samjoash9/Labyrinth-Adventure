extends Node2D
class_name central_hub

@onready var player: Player = $Player

# STONES
@onready var wizard_stone: AnimatedSprite2D = $wizard_stone
@onready var knight_stone: AnimatedSprite2D = $knight_stone
@onready var rogue_stone: AnimatedSprite2D = $rogue_stone

func _ready() -> void:
	player.position = GameManager.central_hub_last_position + Vector2i(0, 20)
	# ready the stones
	match GameManager.selected_hero:
		"rogue":
			rogue_stone.visible = false
			rogue_stone.get_node("Area2D2").get_node("rogue_interaction").disabled = true
		"knight":
			knight_stone.visible = false
			knight_stone.get_node("Area2D").get_node("knight_interaction").disabled = true
		"wizard":
			wizard_stone.visible = false
			wizard_stone.get_node("Area2D2").get_node("wizard_interaction").disabled = true
