extends PanelContainer

@export var item: Item:
	set(value):
		item = value
		%Icon.texture = item.icon
		%Name.text = item.name
		%Level.text = "Level: " + str(item.level)
		%Description.text = value.upgrades[value.level-1].description
		
func _on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		get_parent().check_item(item)
		
		item.upgrade_item()
		get_parent().close_option()
