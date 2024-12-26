extends CharacterBody2D
class_name BaseEnemy

# EFFECTS
const DAMAGE_TEXT = preload("res://ui/damage_text.tscn")
const DEATH_EFFECT = preload("res://core/effects/death_effect.tscn")
const SPAWN_EFFECT = preload("res://core/effects/spawn_effect.tscn")
const PICKABLE_ITEM = preload("res://core/utility/pickable_item.tscn")
const ENEMYPROJECTILE = preload("res://core/Enemies/projectiles/enemyprojectile.tscn")

@onready var pathfinder: NavigationAgent2D = $NavigationAgent2D

@onready var target: Player = get_tree().get_first_node_in_group("player")
var enemyType : Enemy:
	set(value):
		enemyType = value
		hitPoints = enemyType.hitPoints
		movementSpeed = enemyType.movementSpeed
		damage = enemyType.damage
		%SpriteFrames.sprite_frames = enemyType.animation
		%SpriteFrames.play("default")
		$NavigationAgent2D.target_desired_distance = enemyType.attackRadius
		%AttackCoolDown.wait_time = enemyType.attackSpeed
		%AttackRadius.shape.radius = enemyType.attackRadius
		
var hitPoints: float:
	set(value):
		hitPoints = value
		if hitPoints <= 0:
			var deathfx = DEATH_EFFECT.instantiate()
			deathfx.global_position = global_position
			add_sibling(deathfx)
			if enemyType.drops != null:
				var drop = PICKABLE_ITEM.instantiate()
				drop.pickableData = enemyType.get_drop()
				drop.global_position = global_position
				add_sibling.call_deferred(drop)
			GameManager.score += enemyType.scoreValue
			queue_free()
			
var movementSpeed: float
var damage : float
var separation
func check_separation():
	separation = (target.global_position - global_position).length()
	if separation < target.nearest_enemy_distance: 
		target.nearest_enemy = self
	if separation >= 600:
		queue_free()

func _ready() -> void:
	set_process(false)
	var spawnInstance = SPAWN_EFFECT.instantiate()
	spawnInstance.global_position = global_position
	add_sibling(spawnInstance)
	var tween = get_tree().create_tween().set_parallel(true)
	tween.tween_property(self, "modulate", Color(1,1,1,1), 2).set_trans(Tween.TRANS_QUINT)
	tween.chain().tween_callback($CollisionShape2D.set_deferred.bind("disabled", false))
	tween.chain().tween_callback(self.set_process.bind(true))
	tween.chain().tween_callback(%AttackRadius.set_deferred.bind("disabled", false))
	
func _process(_delta: float) -> void:
	check_separation()
	var current_agent_position = global_position
	var next_path_position = pathfinder.get_next_path_position()
	var new_velocity = current_agent_position.direction_to(next_path_position) * movementSpeed
	if pathfinder.avoidance_enabled:
		pathfinder.set_velocity(new_velocity)
	else:
		_on_navigation_agent_2d_velocity_computed(new_velocity)
	if (target.global_position.x - global_position.x) <= 0:
		%SpriteFrames.flip_h = true
	else:
		%SpriteFrames.flip_h = false
	move_and_slide()

func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity

func _on_attack_area_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		%AttackRadius.set_deferred("disabled", true)
		if enemyType.attackType == enemyType.attackTypes.MELEE:
			body.take_damage(damage)
		else:
			if enemyType is RangedEnemy:
				var rangedAttack: RangedAttack = ENEMYPROJECTILE.instantiate()
				rangedAttack.direction = (target.global_position -  self.global_position).normalized()
				rangedAttack.global_position = global_position
				rangedAttack.damage = self.damage 
				rangedAttack.speed = enemyType.projectileSpeed
				rangedAttack.sprite = enemyType.projectile
				call_deferred("add_sibling" , rangedAttack)
		%SpriteFrames.play("attack")
		set_process(false)
		$AttackCoolDown.start()
		
func _on_attack_cool_down_timeout() -> void:
	%SpriteFrames.play("default")
	%AttackRadius.set_deferred("disabled", false)
	set_process(true)

func take_damage(enemydamage,direction):
	hitPoints-=enemydamage
	var damageText = DAMAGE_TEXT.instantiate()
	damageText.text = str(enemydamage)
	damageText.position = position + Vector2(-50 ,-25)
	get_tree().current_scene.add_child(damageText)
	var tween = create_tween().set_parallel(true)
	tween.chain().tween_property(self, "global_position" , global_position-direction, .2)
	tween.tween_property(self, "modulate", Color(1,0,0) , 0.1)
	tween.chain().tween_property(self, "modulate", Color(1,1,1) , 0.1)
	
func _on_path_finder_cooldown_timeout() -> void:
	await get_tree().process_frame
	pathfinder.target_position = target.global_position
	
func _on_sprite_frames_animation_finished() -> void:
	%SpriteFrames.play("idle")
