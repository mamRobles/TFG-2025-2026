extends Control
var info =false
const fin_juego = preload("res://Juego/sonidos/wavs/fin_juego.wav")
const boton_salir = preload("res://Juego/sonidos/wavs/botonsalir.wav")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	VariablesGlobales.playtts(fin_juego, %TTS)
	await(%TTS.finished)
	#VariablesGlobales.tts_habla($MarginContainer/VBoxContainer/Label.text, 0)
	$MarginContainer/VBoxContainer/Button.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Inicio/Menú/Scenes/menúInicio.tscn")


func _on_button_focus_entered() -> void:
	VariablesGlobales.playtts(boton_salir,%TTS)
	await(%TTS.finished)
	#VariablesGlobales.tts_habla($MarginContainer/VBoxContainer/Button.text, 1)
