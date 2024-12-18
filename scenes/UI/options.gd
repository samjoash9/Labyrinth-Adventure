extends CanvasLayer

@onready var main_menu: CanvasLayer = $main_menu

func _on_exit_options_button_pressed() -> void:
	get_parent().visible = true
	queue_free()
