extends Area2D
class_name HurtBox

@export var HealthComponent : healthComponent
@export_enum("cooldown","disabled") var hurtboxtype = 0

signal hurt

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("attack"):
		if not area.get("damage"):
			match hurtboxtype: 
				0: 
					call_deferred("set", "disabled" , true)
					%disabledTimer.start()
				1: 
					if area.has_method("invulnirableState"):
						area.invulnirableState()
		HealthComponent.attacked(area.damage)
		emit_signal("hurt")

func _on_disabled_timer_timeout() -> void:
	call_deferred("set", "disabled" , false)
