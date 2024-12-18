extends Node2D
const TEST_STAGE = preload("res://scenes/game_modes/test_stage.tscn")
const CENTRAL_HUB = preload("res://scenes/central_hub.tscn")
var currentSceneInstance
var currentScene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentScene = preload("res://scenes/parallax_intro/game_start.tscn")
	currentSceneInstance = currentScene.instantiate()
	add_child(currentSceneInstance)
	

func changeScene(newScene : PackedScene):
	
	currentSceneInstance.queue_free()
	currentScene = newScene
	currentSceneInstance = currentScene.instantiate()
	add_child(currentSceneInstance)
