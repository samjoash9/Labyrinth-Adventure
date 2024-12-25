extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = get_tree().create_tween().set_parallel(true)
	tween.tween_property(self, "modulate", Color(1,1,1,1) , 1).set_trans(Tween.TRANS_EXPO)
	tween.tween_property(self, "scale", Vector2(1,1) , 1).set_trans(Tween.TRANS_EXPO)
	tween.chain().tween_property(self, "modulate", Color(1,1,1,0) , 2).set_trans(Tween.TRANS_EXPO)
	tween.tween_property(self, "scale", Vector2(.1,.1) , 2).set_trans(Tween.TRANS_EXPO)
	tween.chain().tween_callback(self.queue_free)
