class_name UserPrefs extends Resource

@export_range(0, 1, .05) var vol_musica: float = 1.0
@export_range(0, 1, .05) var vol_sfx: float = 1.0
@export_range(0, 1, .05) var vol_general: float = 1.0
@export_range(0, 1, .05) var vol_tts: float = 0.2
@export var voz_menus: int  #id de la voz del tts para menús
@export var voz_acciones: int #id de la voz del tts para comandos

const USER_PREFS_PATH: String = "user://prefs_usu.tres"

func save() -> void:
	ResourceSaver.save(self, USER_PREFS_PATH)
	
static func load_or_create() -> UserPrefs:
	var res: UserPrefs
	if FileAccess.file_exists(USER_PREFS_PATH):
		res = load(USER_PREFS_PATH) as UserPrefs
	else:
		res = UserPrefs.new()
	return res
