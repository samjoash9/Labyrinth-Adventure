extends Area2D

@export var jk : Enemy

func _ready() -> void:
	print(jk.get_drop())

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		activate()

func activate():
	var tween:= get_tree().create_tween()
	tween.tween_property(self, "global_position:x", 200, 1).as_relative().set_trans(Tween.TRANS_QUINT)
 
