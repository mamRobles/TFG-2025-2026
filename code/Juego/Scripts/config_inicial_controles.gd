extends Control

var user_prefs: UserPrefs

@onready var Boton_salir = $MarginContainer/VBoxContainer/Salir
@onready var Boton_siguiente = $MarginContainer/VBoxContainer/Siguiente
var configurado: bool= false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	VariablesGlobales.tts_habla("Configuración de controles",0)

	# load (or create) file with these saved preferences
	user_prefs = UserPrefs.load_or_create()
	#if music_slider:
	#	music_slider.value = user_prefs.vol_musica
	#if sfx_slider:
	#	sfx_slider.value = user_prefs.vol_sfx
	#if general_slider:
	#	general_slider.value = user_prefs.vol_general
	#if tts_slider:
	#	tts_slider.value = user_prefs.vol_tts
	
	#    cambiar teclas de interaccion
	Boton_siguiente.grab_focus() #TODO: cuando añadas cosas q se metan en userprefs y eso
	configurado = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_siguiente_pressed() -> void:
	get_tree().change_scene_to_file("res://Juego/scenes/ConfigInicial_modo.tscn")
	pass # Replace with function body.


func _on_siguiente_focus_entered() -> void:
	VariablesGlobales.tts_habla(Boton_siguiente.text,1)

	pass # Replace with function body.


func _on_salir_pressed() -> void:
	user_prefs.save()
	get_tree().change_scene_to_file("res://Inicio/Menú/Scenes/menúInicio.tscn")
	pass # Replace with function body.


func _on_salir_focus_entered() -> void:
	VariablesGlobales.tts_habla(Boton_salir.text,1)
	pass # Replace with function body.
