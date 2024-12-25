extends CanvasLayer

@onready var display_mode_option_button: OptionButton = $Control/MarginContainer/VBoxContainer/DisplayMode_HBoxContainer3/DisplayMode_OptionButton
@onready var music_hslider: HSlider = $Control/MarginContainer/VBoxContainer/Music_HBoxContainer/Music_Hslider
@onready var sound_fx_hslider: HSlider = $Control/MarginContainer/VBoxContainer/SoundFX_HBoxContainer2/SoundFX_Hslider

var maindisplaysize : Vector2i = DisplayServer.screen_get_size(0)

# CLICK SOUND
@onready var click_sound: AudioStreamPlayer2D = $click_sound

var user_prefs: UserPreferences
var bus_index_music
var bus_index_soundfx

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bus_index_music = AudioServer.get_bus_index("Music")
	bus_index_soundfx = AudioServer.get_bus_index("SoundFX")
	user_prefs = UserPreferences.load_or_create()
	if music_hslider:
		music_hslider.value = user_prefs.music_audio_level
		AudioServer.set_bus_volume_db(bus_index_music,linear_to_db(music_hslider.value))
	if sound_fx_hslider:
		sound_fx_hslider.value = user_prefs.soundFx_audio_level
		AudioServer.set_bus_volume_db(bus_index_soundfx, linear_to_db(sound_fx_hslider.value))
	if display_mode_option_button:
		display_mode_option_button.selected = user_prefs.displaymode

func _on_back_button_pressed() -> void:
	click_sound.play()
	get_parent().visible = true
	queue_free()

	if get_parent().get_parent().get_node("Player"):
		get_parent().get_parent().get_node("Player").set_process(true)
	if get_parent().get_node("Player"):
		get_parent().get_node("Player").set_process(true)

func _on_music_hslider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1,linear_to_db(value))
	if user_prefs:
		user_prefs.music_audio_level = value
		user_prefs.save()

func _on_sound_fx_hslider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(2,linear_to_db(value))
	if user_prefs:
		user_prefs.soundFx_audio_level = value
		user_prefs.save()

func _on_display_mode_option_button_item_selected(index: int) -> void:
	click_sound.play()
	const defaultSize: Vector2i = Vector2i(640*2,360*2)
	
	match index: 
		2:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_size(defaultSize)
			DisplayServer.window_set_position((maindisplaysize-defaultSize)/2)
		1: 
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
			
	if user_prefs:
		user_prefs.displaymode = index
		user_prefs.save()

func _on_display_mode_option_button_pressed() -> void:
	click_sound.play()
