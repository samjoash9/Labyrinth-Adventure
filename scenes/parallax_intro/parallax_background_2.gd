extends ParallaxBackground

@onready var parallax_layer: ParallaxLayer = $ParallaxLayer
@onready var parallax_layer_2: ParallaxLayer = $ParallaxLayer2
@onready var parallax_layer_3: ParallaxLayer = $ParallaxLayer3
@onready var parallax_layer_4: ParallaxLayer = $ParallaxLayer4

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	parallax_layer.motion_offset.x = 2 * delta
	parallax_layer_2.motion_offset.x -= 8.2 * delta
	parallax_layer_3.motion_offset.x -= 14 * delta
	parallax_layer_4.motion_offset.x -= 18 * delta
