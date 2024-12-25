extends AnimatedSprite2D

@onready var player: Player = $"../Player"
@onready var mini_village: central_hub = $".."
const PLAYER = preload("res://characters/baseCharacter/player.tscn")

# WIZARD STONE SCRIPT
@onready var rogue_stone: AnimatedSprite2D = $"../rogue_stone"
@onready var knight_stone: AnimatedSprite2D = $"../knight_stone"

# INTERACTIONS
@onready var knight_interaction: CollisionShape2D = $"../knight_stone/Area2D/knight_interaction"
@onready var wizard_interaction: CollisionShape2D = $Area2D2/wizard_interaction
@onready var rogue_interaction: CollisionShape2D = $"../rogue_stone/Area2D2/rogue_interaction"

var player_in_area = false

func _ready() -> void:
	Dialogic.signal_event.connect(DialogicSignal)

func _process(delta: float) -> void:
	if player_in_area:
		if Input.is_action_just_pressed("e"):
			run_dialogue("Wizard Stone")
			player.set_process(false)
	
func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)

func DialogicSignal(arg: String):
	if arg == "wizard_confirm":
		player.set_process(true)
		# set visibility of wizard stone into false
		visible = false
		wizard_interaction.disabled = true
		
		# check game manager for the current selected hero
		match GameManager.selected_hero:
			"knight":
				knight_stone.visible = true
				knight_interaction.disabled = false
			"rogue":
				rogue_stone.visible = true
				rogue_interaction.disabled = false
		
		GameManager.selected_hero = "wizard"
		player.reselect_character()
	if arg == "wizard_cancel":
		player.set_process(true)

func _on_area_2d_2_body_entered(body: Player) -> void:
	player_in_area = true

func _on_area_2d_2_body_exited(body: Player) -> void:
	player_in_area = false
