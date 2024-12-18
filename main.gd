extends Node2D
const TEST_STAGE = preload("res://scenes/game_modes/test_stage.tscn")
const CENTRAL_HUB = preload("res://scenes/central_hub.tscn")
var current
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current = CENTRAL_HUB.instantiate()
	add_child(current)
	await get_tree().create_timer(5).timeout
	current.queue_free()
	current = TEST_STAGE.instantiate()
	add_child(current)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
