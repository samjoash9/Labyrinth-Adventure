extends Node2D
class_name Projectile

@onready var screen: VisibleOnScreenNotifier2D = $Screen
@onready var boundary: Area2D = $Boundary
@onready var speed: float = 500
@onready var is_peircing : bool  = true
@onready var parent : Upgrade = get_parent()
const  SPEEDMULTIPLIER = 100
var direction 
var angle
var target

func _ready() -> void:
	if parent.upgradeInfo.is_piercing != null:
		is_peircing = parent.upgradeInfo.is_piercing
	if parent.upgradeInfo.attackSpeed != null:
		speed = parent.upgradeInfo.attackSpeed
	screen.screen_exited.connect(onscreenExit)
	boundary.body_entered.connect(onBodyEntered)
	if get_parent().target:
		target = get_parent().target.position
		angle = global_position.direction_to(target)
		look_at(target)
		
func _physics_process(delta: float) -> void:
	position += angle * speed * SPEEDMULTIPLIER * delta

func onscreenExit() -> void:
	queue_free()

func onBodyEntered(body: Node2D):
	if is_peircing:
		if is_instance_of(body, TileMapLayer):
			const HIT_EFFECT = preload("res://common/fx/hit_effect.tscn")
			var hit = HIT_EFFECT.instantiate()
			hit.global_position = global_position
			add_sibling(hit)
			queue_free()
	else:
		if is_instance_of(body, TileMapLayer) or is_instance_of(body, Enemy):
			const HIT_EFFECT = preload("res://common/fx/hit_effect.tscn")
			var hit = HIT_EFFECT.instantiate()
			hit.global_position = global_position
			add_sibling(hit)
			queue_free()
			
	
