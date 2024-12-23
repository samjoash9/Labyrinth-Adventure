extends CanvasLayer
@onready var player: Player = $".."
@onready var label: Label = $VBoxContainer/Label
@onready var label_3: Label = $VBoxContainer/Label3
@onready var label_4: Label = $VBoxContainer/Label4
@onready var label_5: Label = $VBoxContainer/Label5
@onready var label_6: Label = $VBoxContainer/Label6
@onready var label_7: Label = $VBoxContainer/Label7
@onready var label_8: Label = $VBoxContainer/Label8

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	label.text = "Max Hp: " + str(player.maxHitpoints)
	label_3.text = "Movement: " + str(player.movementSpeed)
	label_4.text = "Might: " + str(player.might)
	label_5.text = "Armor: " + str(player.armor)
	label_6.text = "Magnet Area: " + str(player.magnetArea)
	label_7.text = "Area Mult: " + str(player.areaMultiplier)
	label_8.text = "Growth: " + str(player.growth)
