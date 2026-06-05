extends Control
const configuracion_audio = preload("res://Juego/sonidos/wavs/configuracion_audio.wav")
const boton_salir = preload("res://Juego/sonidos/wavs/botonsalir.wav")
const volumen_general = preload("res://Juego/sonidos/wavs/volumen_general.wav")
const volumen_musica = preload("res://Juego/sonidos/wavs/volumen_musica.wav")
const volumen_tts = preload("res://Juego/sonidos/wavs/volumen_tts.wav")
const volumen_efectos = preload("res://Juego/sonidos/wavs/volumen_efectos.wav")
const boton_siguiente = preload("res://Juego/sonidos/wavs/boton_siguiente.wav")

var user_prefs: UserPrefs
@onready var Boton_salir = $MarginContainer/VBoxContainer/Salir
@onready var Boton_siguiente = $MarginContainer/VBoxContainer/Siguiente
@onready var music_slider =$MarginContainer/VBoxContainer/GridContainer/musicSlider
@onready var sfx_slider =$MarginContainer/VBoxContainer/GridContainer/sfxSlider
@onready var general_slider =$MarginContainer/VBoxContainer/GridContainer/generalSlider
@onready var tts_slider = $MarginContainer/VBoxContainer/GridContainer/ttsSlide
@onready var GENERAL_BUS_ID = AudioServer.get_bus_index("Master")
@onready var MUSIC_BUS_ID = AudioServer.get_bus_index("bus_Musica")
@onready var SFX_BUS_ID = AudioServer.get_bus_index("bus_SFX")
@onready var TTS_BUS_ID = AudioServer.get_bus_index("bus_TTS")
var configurado: bool= false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	VariablesGlobales.playtts(configuracion_audio,%TTS)
	await(%TTS.finished)
	#VariablesGlobales.tts_habla("Configuración de audio",0)


	# load (or create) file with these saved preferences
	user_prefs = UserPrefs.load_or_create()
	if music_slider:
		music_slider.value = user_prefs.vol_musica
	if sfx_slider:
		sfx_slider.value = user_prefs.vol_sfx
	if general_slider:
		general_slider.value = user_prefs.vol_general
	if tts_slider:
		tts_slider.value = user_prefs.vol_tts
	general_slider.grab_focus()
	configurado = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_salir_pressed() -> void:
	user_prefs.save()
	get_tree().change_scene_to_file("res://Inicio/Menú/Scenes/menúInicio.tscn")
	pass # Replace with function body.


func _on_salir_focus_entered() -> void:
	VariablesGlobales.playtts(boton_salir,%TTS)
	await(%TTS.finished)
	#VariablesGlobales.tts_habla(Boton_salir.text,1)
	pass # Replace with function body.

func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(SFX_BUS_ID, value)
	AudioServer.set_bus_mute(SFX_BUS_ID, value < .05)
	user_prefs.vol_sfx= value
	#var entero:int = round(value*100)
	
	if configurado:
		$sfx.play()
		#VariablesGlobales.tts_habla(str(entero),1)

func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(MUSIC_BUS_ID, value)
	AudioServer.set_bus_mute(MUSIC_BUS_ID, value < .05)
	user_prefs.vol_musica = value
#	var entero:int = round(value*100)

	if configurado:
		$musica.play()
		#VariablesGlobales.tts_habla(str(entero),1)

func _on_general_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(GENERAL_BUS_ID, value)
	AudioServer.set_bus_mute(GENERAL_BUS_ID, value < .05)
	user_prefs.vol_general = value
	#var entero:int = round(value*100)
	if configurado:
		$general.play()
		#VariablesGlobales.tts_habla(str(entero),1)


func _on_general_slider_focus_entered() -> void:
	VariablesGlobales.playtts(volumen_general,%TTS)
	await(%TTS.finished)
	#VariablesGlobales.tts_habla("Volumen General",1)
	pass # Replace with function body.


func _on_music_slider_focus_entered() -> void:
	VariablesGlobales.playtts(volumen_musica,%TTS)
	await(%TTS.finished)
	#VariablesGlobales.tts_habla("Volumen Música",1)

	pass # Replace with function body.


func _on_sfx_slider_focus_entered() -> void:
	VariablesGlobales.playtts(volumen_efectos,%TTS)
	await(%TTS.finished)
	#VariablesGlobales.tts_habla("Volumen efectos",1)
	pass # Replace with function body.

func _on_siguiente_pressed() -> void:
		#siguiente configuracion
	user_prefs.save()
	get_tree().change_scene_to_file("res://Juego/scenes/ConfigInicial_modo.tscn")
	pass # Replace with function body.


func _on_siguiente_focus_entered() -> void:
	VariablesGlobales.playtts(boton_siguiente,%TTS)
	await(%TTS.finished)
	#VariablesGlobales.tts_habla(Boton_siguiente.text,1)
	pass # Replace with function body.


func _on_tts_slide_focus_entered() -> void:
	VariablesGlobales.playtts(volumen_tts,%TTS)
	await(%TTS.finished)
	pass # Replace with function body.


func _on_tts_slide_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(TTS_BUS_ID, value)
	AudioServer.set_bus_mute(TTS_BUS_ID, value < .05)
	user_prefs.vol_tts= value
	#var entero:int = round(value*100)
	
	if configurado:
		$tts.play()
		#VariablesGlobales.tts_habla(str(entero),1)
