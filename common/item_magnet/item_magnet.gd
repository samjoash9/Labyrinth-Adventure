extends Area2D
@export var magnet_stregth: float = 1
@onready var magnet_area: CollisionShape2D = $MagnetArea

func _on_area_entered(area: PickableItem) -> void:
	if is_instance_of(area, PickableItem):
		area.target = get_parent()
		area.magnet_stregth = magnet_stregth
		area.set_process(true)

func _on_area_exited(area: Area2D) -> void:
	if is_instance_of(area, PickableItem):
		area.set_process(false)
