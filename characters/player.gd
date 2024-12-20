extends CharacterBody2D
class_name playerCharacter

enum {
	IDLE,
	MOVING,
	DEAD,
	HURT
}
@onready var enemy_scanner: EnemyScanner = $EnemyScanner

var state = IDLE
var SELECTED_CLASS : CharacterResource

@onready var upgrade_pos_1: Marker2D = $UpgradePos1
@onready var upgrade_pos_2: Marker2D = $UpgradePos2
@onready var upgrade_pos_3: Marker2D = $UpgradePos3
@onready var upgrade_pos_5: Marker2D = $UpgradePos5
@onready var upgrade_pos_6: Marker2D = $UpgradePos6
@onready var upgrade_pos_7: Marker2D = $UpgradePos7
@onready var upgrade_pos_8: Marker2D = $UpgradePos8
@onready var upgrade_pos_4: Marker2D = $UpgradePos4
@onready var axe: Node2D = $Axe
@onready var spear: Node2D = $Spear
@onready var fire_ball: Node2D = $FireBall
@onready var ice_spike: Node2D = $IceSpike

var selected : String = "knight" 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SELECTED_CLASS  = load("res://resources/jobs/%s.tres" % selected)
	axe.global_position = upgrade_pos_6.global_position
	spear.global_position = upgrade_pos_4.global_position
	fire_ball.global_position = upgrade_pos_3.global_position
	fire_ball.global_position = upgrade_pos_1.global_position
	if SELECTED_CLASS: 
		var player = SELECTED_CLASS.animationComponent.instantiate()
		#var weapon = SELECTED_CLASS.weapon.weaponAnimations.instantiate()
		add_child(player)
		#add_child(weapon)
		#weapon.position = Vector2(0,-9)
		#weapon.get_node("AnimationPlayer").speed_scale = SELECTED_CLASS.weapon.attackSpeed

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(_delta: float) -> void:
	if SELECTED_CLASS:
		if SELECTED_CLASS.basicStats.Hitpoints > 0:
				var inputDir = Input.get_vector("left", "right", "up", "down").normalized()
				velocity = inputDir * SELECTED_CLASS.basicStats.Movespeed
				velocity.normalized()
				if velocity: 
					state = MOVING
				else:
					state = IDLE
				move_and_slide()
		else : 
			state = DEAD

	
