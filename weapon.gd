extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position() - global_position.normalized())
	if ((get_global_mouse_position() - global_position.normalized()).x) > 0:
		self.z_index = -1
	else:
		self.z_index = 0
