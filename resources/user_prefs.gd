class_name UserPreferences extends Resource

@export_range(0,1,0.5) var music_audio_level: float = 1.0
@export_range(0, 1, 0.5) var soundFx_audio_level: float = 1.0
@export var displaymode: int = 0
@export var unlocked_levels: int = 1

func save()->void:
	ResourceSaver.save(self, "res://user_prefs.tres")

static func load_or_create() -> UserPreferences:
	var res: UserPreferences = load("res://user_prefs.tres") as UserPreferences
	if !res: 
		res = UserPreferences.new()
	return res
