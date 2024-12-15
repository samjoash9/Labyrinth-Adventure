extends Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func playAttack(dir):
	if dir > 0 :
		animation_player.play("attackright")
	else:
		animation_player.play_backwards("attackright")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if(anim_name=="attackleft"):
		animation_player.play("RESETLEFT")
	elif (anim_name=="attackright"):
		animation_player.play("RESETRIGHT")
