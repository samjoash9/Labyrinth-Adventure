extends Area2D
class_name PickableItem

@onready var target: Player = get_tree().get_first_node_in_group("player")
@onready var magnet_stregth: float = 1

@export var pickableData:Pickables:
	set(value):
		pickableData = value
		$AnimatedSprite2D.sprite_frames = pickableData.sprite
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pickableData.playerReference = target
	$AnimatedSprite2D.play("default")
	set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	global_position = global_position.move_toward(target.position , magnet_stregth)
	 
func _on_body_entered(body: Node2D) -> void:
	if is_instance_of(body, Player):
		pickableData.activate()
		queue_free()
