extends Node
const tres_teclas = preload("res://Juego/sonidos/wavs/tres_teclas.wav")
const piano_resuelto = preload("res://Juego/sonidos/wavs/piano_resuelto.wav")
const teclas_rotas = preload("res://Juego/sonidos/wavs/teclas_rotas.wav")

var correcto = [1,2,0]
var teclas_pulsadas= [0,0,0]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Control/MarginContainer/HBoxContainer/tecla1.grab_focus()
	VariablesGlobales.playtts(tres_teclas,%TTS)
	#VariablesGlobales.tts_para()
	#VariablesGlobales.tts_habla("hay tres teclas, ¿cuál es la combinación?", 1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_pressed("exit"):
		get_tree().change_scene_to_file("res://Juego/scenes/Mapa.tscn")
	if correcto == teclas_pulsadas and !VariablesGlobales.piano_resuelto:
		VariablesGlobales.playtts(piano_resuelto,%TTS)
		#VariablesGlobales.tts_habla("El piano se ha abierto y dentro había una caña de pescar, me la voy a llevar.",0)
		VariablesGlobales.piano_resuelto =true


func _on_control_focus_entered() -> void:
	$Control/MarginContainer/HBoxContainer/tecla1.grab_focus()


func _on_tecla_1_pressed() -> void:
	if VariablesGlobales.piano_resuelto:
		VariablesGlobales.playtts(teclas_rotas,%TTS)
		#VariablesGlobales.tts_habla("Las teclas ya no se mueven", 0)
	else:
		$Control/MarginContainer/HBoxContainer/tecla1/AudioStreamPlayer2D.play()
		teclas_pulsadas.push_back(2)
		teclas_pulsadas.pop_front()


func _on_tecla_2_pressed() -> void:
	if VariablesGlobales.piano_resuelto:
		VariablesGlobales.playtts(teclas_rotas,%TTS)
		#VariablesGlobales.tts_habla("Las teclas ya no se mueven", 0)
	else:
		$Control/MarginContainer/HBoxContainer/tecla2/AudioStreamPlayer2D.play()
		teclas_pulsadas.push_back(1)
		teclas_pulsadas.pop_front()


func _on_tecla_3_pressed() -> void:
	if VariablesGlobales.piano_resuelto:
		VariablesGlobales.playtts(teclas_rotas,%TTS)
		#VariablesGlobales.tts_habla("Las teclas ya no se mueven", 0)
	else:
		$Control/MarginContainer/HBoxContainer/tecla3/AudioStreamPlayer2D.play()
		teclas_pulsadas.push_back(0)
		teclas_pulsadas.pop_front()
