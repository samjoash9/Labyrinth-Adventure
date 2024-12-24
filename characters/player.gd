extends CharacterBody2D
class_name playerCharacter

enum states{
	IDLE,
	MOVING,
	DEAD,
	HURT
}

@onready var hurt_shape: CollisionShape2D = $HurtBox/HurtShape
@onready var hurt_box: HurtBox = $HurtBox
@onready var enemy_scanner: EnemyScanner = $EnemyScanner
@onready var magnet_area: CollisionShape2D = $Item_Magnet/MagnetArea
@onready var upgrade_slots: Node2D = $UpgradeSlots
@onready var applied_upgrades: Node2D = $AppliedUpgrades



var state = states.IDLE
var SELECTED_CLASS : CharacterResource
var player: Node2D
var weapon: Node2D
@export var selected : String = GameManager.selected_hero

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	Load Selected Class Resource
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
	SELECTED_CLASS  = load("res://resources/jobs/%s.tres" % GameManager.selected_hero)
=======
	SELECTED_CLASS  = load("res://resources/jobs/rouge.tres")
>>>>>>> Stashed changes
=======
	SELECTED_CLASS  = load("res://resources/jobs/rouge.tres")
>>>>>>> Stashed changes
=======
	SELECTED_CLASS  = load("res://resources/jobs/rouge.tres")
>>>>>>> Stashed changes
=======
	SELECTED_CLASS  = load("res://resources/jobs/rouge.tres")
>>>>>>> Stashed changes
=======
	SELECTED_CLASS  = load("res://resources/jobs/rouge.tres")
>>>>>>> Stashed changes
	
#	Create Instances Of the Class Body, Primary weapon, and Unique Skill
	if SELECTED_CLASS: 
		instantiate_player()
		#weapon.get_node("AnimationPlayer").speed_scale = SELECTED_CLASS.weapon.attackSpeed
	scale.x = 0.5
	scale.y = 0.5
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func instantiate_player():
	player = SELECTED_CLASS.animationComponent.instantiate()
	weapon = SELECTED_CLASS.weapon.weaponAnimations.instantiate()
	add_child(player)
	weapon.position = Vector2(0,-9)

func reselect_character():
	player.queue_free()
	#weapon.queue_free()
	SELECTED_CLASS = load("res://resources/jobs/%s.tres" % GameManager.selected_hero)
	instantiate_player()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("e"):
		reselect_character()
	if SELECTED_CLASS:
		if SELECTED_CLASS.basicStats.Hitpoints > 0:
				var inputDir = Input.get_vector("left", "right", "up", "down").normalized()
				velocity = inputDir * SELECTED_CLASS.basicStats.moveSpeed
				velocity.normalized()
				move_and_slide()
