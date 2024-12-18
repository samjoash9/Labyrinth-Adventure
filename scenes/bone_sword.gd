extends Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var cool_down: Timer = $CoolDown
@onready var marker_2d: Marker2D = $Marker2D

const SLASH_WAVE = preload("res://scenes/slash_wave.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		playAttackAnim()
		
func playAttackAnim():
	animation_player.play("Attack")
	cool_down.start()
	set_process(false)
	
	
func _on_cool_down_timeout() -> void:
	set_process(true)
	
func spawnSlash():
	var slash = SLASH_WAVE.instantiate()
	slash.global_position = marker_2d.global_position
	slash.global_rotation = marker_2d.global_rotation
	add_child(slash)
	
