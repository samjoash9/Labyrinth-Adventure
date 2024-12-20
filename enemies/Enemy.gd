extends CharacterBody2D
class_name Enemy

enum states{
	IDLE,
	MOVING,
	ATTACKING,
	HURT,
	DEAD,
}

@export var basicStats: EnemyStats
@export var state : states = states.IDLE
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var hurt_box: HurtBox = $HurtBox
@onready var attack_area: Area2D = $AttackArea
@onready var attack_radius: CollisionShape2D = $AttackArea/AttackRadius
@onready var hit_box_component: hitBoxComponent = $hitBoxComponent
@onready var player_finder: PlayerFinder = $PlayerFinder

var direction = Vector2.ZERO
const KNOCKBACKSPEED := 30


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	SET BASIC STATS FOR COMPONENTS THAT NEED THEM
	hurt_box.HITPOINTS = basicStats.hitPoints
	hit_box_component.damage = basicStats.attackDamage
	hit_box_component.knockback = basicStats.knockBack
	player_finder.moveSpeed = basicStats.movementSpeed
	attack_radius.shape.radius = basicStats.attackRadius
	
#	CONNECT SIGNALS
	hurt_box.hurt.connect(on_hurt)
	hurt_box.dead.connect(on_death)
	attack_area.body_entered.connect(on_attack_area_entered)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if state == states.ATTACKING:
		animation_tree["parameters/Attack/blend_position"] = direction.x
		set_process(false)
	if state == states.DEAD:
		animation_tree["parameters/Dead/blend_position"] = direction.x
	if state == states.HURT:
		animation_tree["parameters/Hurt/blend_position"] = direction.x
	if state == states.IDLE:
		animation_tree["parameters/Idle/blend_position"] = direction.x
	if state == states.MOVING:
		animation_tree["parameters/Move/blend_position"] = direction.x
	
	if state!= states.DEAD:
		if state != states.HURT:
			if state != states.ATTACKING:
				if velocity:
					state  = states.MOVING
				else:
					state = states.IDLE
	move_and_slide()
	
func on_hurt(hurtDirection: Variant, knockback: Variant):
	if !is_processing():
		set_process(true)
	state = states.HURT
	velocity += (-hurtDirection*knockback) * KNOCKBACKSPEED
	animation_tree["parameters/Hurt/blend_position"] = hurtDirection.x
	move_and_slide()
	
func on_death():
	state = states.DEAD
	
func on_attack_area_entered(body: Node2D) -> void:
	if is_instance_of(body, playerCharacter):
		state = states.ATTACKING

func spawnEXP():
	const EXP_ORB_NEW = preload("res://environment/exp_orb_new.tscn")
	var expOrbInstance = EXP_ORB_NEW.instantiate()
	if (expOrbInstance == null):
		print("ORB")
	else: 
		print("Body")

	#expOrbInstance.global_position = global_position
	#add_sibling(expOrbInstance)
	
func spawnDeathEffect():
	const DEATH_EFFECT = preload("res://common/death_effect.tscn")
	var effectInstance = DEATH_EFFECT.instantiate()
	effectInstance.global_position = global_position
	add_sibling(effectInstance)
