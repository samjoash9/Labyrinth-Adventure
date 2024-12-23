extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())

func attack(): 
	animation_player.play("attack")
