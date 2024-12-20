extends Upgrade
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func useAttack():
	animation_player.play("attack")
