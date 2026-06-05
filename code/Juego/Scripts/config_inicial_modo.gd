extends Control
const boton_salir = preload("res://Juego/sonidos/wavs/botonsalir.wav")
const modo_juego = preload("res://Juego/sonidos/wavs/modo_juego.wav")
const boton_1jugador = preload("res://Juego/sonidos/wavs/boton_1jugador.wav")
const boton_2jugadores = preload("res://Juego/sonidos/wavs/boton_2jugadores.wav")

@onready var Boton_salir = $MarginContainer/VBoxContainer/Salir
@onready var Boton_1jugador = $"MarginContainer/VBoxContainer/1pl"
@onready var Boton_2jugador = $"MarginContainer/VBoxContainer/2pl"
@onready var confirmacion = $Confirmacion

@export var modo = 0 # 0 un jugador 1 dos jugadores
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	VariablesGlobales.playtts(modo_juego,%TTS)
	await(%TTS.finished)
	#VariablesGlobales.tts_habla("Modo de juego",0)

	Boton_1jugador.grab_focus() #TODO: cuando añadas cosas q se metan en userprefs y eso



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_salir_pressed() -> void:
	get_tree().change_scene_to_file("res://Inicio/Menú/Scenes/menúInicio.tscn")
	pass # Replace with function body.


func _on_salir_focus_entered() -> void:
	VariablesGlobales.playtts(boton_salir,%TTS)
	await(%TTS.finished)
	#VariablesGlobales.tts_habla(Boton_salir.text,1)
	pass # Replace with function body.


func _on_pl_focus_entered() -> void:
	VariablesGlobales.playtts(boton_1jugador,%TTS)
	await(%TTS.finished)
	#VariablesGlobales.tts_habla(Boton_1jugador.text,1)
	pass # Replace with function body.
	
func _on_p2_focus_entered() -> void:
	VariablesGlobales.playtts(boton_2jugadores,%TTS)
	await(%TTS.finished)

	#VariablesGlobales.tts_habla(Boton_2jugador.text,1)
	pass # Replace with function body.


func _on_pl_pressed() -> void:
	VariablesGlobales.multijugador=false
	%Modo.text = "un jugador"
	modo = 0
	confirmacion.visible=true
	pass # Replace with function body.


func _on_p2_pressed() -> void:
	VariablesGlobales.multijugador=true
	%Modo.text = "dos jugadores"
	modo = 1
	confirmacion.visible=true
	pass # Replace with function body.
