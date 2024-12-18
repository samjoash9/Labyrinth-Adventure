extends Area2D
@onready var sprite_2d: Sprite2D = $Sprite2D

var expValue
func setType(type: String):
	if type == "small":
		sprite_2d.modulate = Color(1,0.843,0,1)
		expValue = 10
	elif type == "medium":
		sprite_2d.modulate = Color(0.6,0,0,1)
		expValue = 20
	elif type == "big":
		sprite_2d.modulate = Color(0,0,0,1)
		expValue = 30
	
