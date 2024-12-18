extends ParallaxBackground

@onready var parallax_layer: ParallaxLayer = $ParallaxLayer
@onready var parallax_layer_2: ParallaxLayer = $ParallaxLayer2
@onready var parallax_layer_3: ParallaxLayer = $ParallaxLayer3
@onready var parallax_layer_4: ParallaxLayer = $ParallaxLayer4
@onready var parallax_layer_5: ParallaxLayer = $ParallaxLayer5
@onready var parallax_layer_6: ParallaxLayer = $ParallaxLayer6
@onready var parallax_layer_7: ParallaxLayer = $ParallaxLayer7
@onready var parallax_layer_8: ParallaxLayer = $ParallaxLayer8
@onready var parallax_layer_9: ParallaxLayer = $ParallaxLayer9

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	parallax_layer_2.motion_offset.x -= 10 * delta
	parallax_layer_3.motion_offset.x -= 15 * delta
	parallax_layer_4.motion_offset.x -= 5 * delta
	parallax_layer_5.motion_offset.x -= 30 * delta
	parallax_layer_6.motion_offset.x -= 48 * delta
	parallax_layer_7.motion_offset.x -= 55 * delta
	parallax_layer_8.motion_offset.x -= 62 * delta
	parallax_layer_9.motion_offset.x -= 70 * delta
