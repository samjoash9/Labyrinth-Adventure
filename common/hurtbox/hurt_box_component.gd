extends Area2D
class_name HurtBox

@onready var hurt_shape: CollisionShape2D = $HurtShape
var HITPOINTS: float
@onready var invulnirable_timer: Timer = $InvulnirableTimer

signal hurt(hurtDirection, knockback)
signal dead()


func _on_area_entered(area: Area2D) -> void:
	
	if area.is_in_group("attack"):
		hurt_shape.call_deferred("set", "disabled" , true)
		invulnirable_timer.start()
		emit_signal("hurt", (area.global_position - global_position).normalized(), area.knockback)
		HITPOINTS-=area.damage
		if (HITPOINTS <= 0):
			emit_signal("dead")
		
func _on_invulnirable_timer_timeout() -> void:
	hurt_shape.call_deferred("set", "disabled" , false)
