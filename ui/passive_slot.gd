extends PanelContainer


@export var item : Passives:
	set(value):
		item = value
		$TextureRect.texture = value.icon

func _ready() -> void:
	if item != null: 
		item.player_reference = owner
