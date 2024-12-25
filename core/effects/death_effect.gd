extends Node2D

func _ready() -> void:
	%AudioStreamPlayer2D.playing = true

func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
