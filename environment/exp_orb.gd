extends PickableItem

@onready var target
@onready var magnet_stregth: float = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process(false)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = global_position.move_toward(target.position , magnet_stregth)
	 
func _on_body_entered(body: Node2D) -> void:
	if is_instance_of(body, playerCharacter):
		GameManager.ExpPoints += 20
		queue_free()
