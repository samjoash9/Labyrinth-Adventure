extends Area2D
class_name SingleShotProjectile
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var direction
var speed
var attackPower
var knockBack
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _ready() -> void:
	$AudioStreamPlayer2D.play()
	pass
	
func _process(delta: float) -> void:
	position += direction * speed * delta
	
func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(attackPower, (self.global_position-body.global_position).normalized() * Vector2(knockBack,knockBack))
