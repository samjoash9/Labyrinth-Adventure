extends Area2D
class_name HurtBox

@onready var hurt_shape: CollisionShape2D = $HurtShape
@export var HITPOINTS: float = 100
@onready var invulnirable_timer: Timer = $InvulnirableTimer

signal hurt(hurtDirection, knockback)

func _on_area_entered(area: hitBoxComponent) -> void:
	if area != null:
		hurt_shape.call_deferred("set", "disabled" , true)
		invulnirable_timer.start()
		emit_signal("hurt", (area.global_position - global_position).normalized(), area.knockback)
		HITPOINTS-=area.damage

func _on_invulnirable_timer_timeout() -> void:
	hurt_shape.call_deferred("set", "disabled" , false)
