extends Node2D
@onready var cooldown: Timer = $Cooldown
@onready var duration: Timer = $Duration
@onready var hitbox_component: hitBoxComponent = $HitboxComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hitbox_component.monitorable = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func activateSkill():
	self.visible = true
	hitbox_component.monitorable = true
	set_process(false)
	duration.start()

func _on_cooldown_timeout() -> void:
	set_process(true)

func _on_duration_timeout() -> void:
	cooldown.start()
	self.visible = false
	hitbox_component.monitorable = false
