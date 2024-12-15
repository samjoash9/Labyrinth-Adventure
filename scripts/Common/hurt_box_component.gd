extends Area2D

@export var HealthComponent : healthComponent
@export_enum("cooldown","disabled") var hurtboxtype = 0

func _on_area_entered(area: hitBoxComponent) -> void:
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
		get_parent().position -= (area.global_position-global_position).normalized() * 15

func _on_disabled_timer_timeout() -> void:
	call_deferred("set", "disabled" , false)
