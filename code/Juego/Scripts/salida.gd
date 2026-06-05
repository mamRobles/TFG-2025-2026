extends Area2D

signal interacted
signal interaction_available
signal interaction_unavailable
var activado = false
var multijugador = VariablesGlobales.multijugador
const acercar_pared_multi_roto = preload("res://Juego/sonidos/wavs/acercar_pared_multi_roto.wav")
const acercar_pared_single_roto = preload("res://Juego/sonidos/wavs/acercar_pared_single_roto.wav")
const acercar_pared_multi = preload("res://Juego/sonidos/wavs/acercar_pared_multi.wav")
const acercar_pared_single = preload("res://Juego/sonidos/wavs/acercar_pared_single.wav")
const alejar_pared_single = preload("res://Juego/sonidos/wavs/alejar_pared_single.wav")
const alejar_pared_multi_arreglado = preload("res://Juego/sonidos/wavs/alejar_pared_multi_arreglado.wav")
const alejar_pared_multi_roto = preload("res://Juego/sonidos/wavs/alejar_pared_multi_roto.wav")
const abrir_ruta_multi = preload("res://Juego/sonidos/wavs/abrir_ruta_multi.wav")
const abrir_ruta_single = preload("res://Juego/sonidos/wavs/abrir_ruta_single.wav")
const revisar_ruta_multi = preload("res://Juego/sonidos/wavs/revisar_ruta_multi.wav")
const revisar_ruta_single = preload("res://Juego/sonidos/wavs/revisar_ruta_single.wav")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process_unhandled_input(false)
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		interacted.emit()
		get_viewport().set_input_as_handled()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if activado:
		get_tree().change_scene_to_file("res://Juego/scenes/Mapa.tscn")


func _on_area_entered(_area: Area2D) -> void:
	set_process_unhandled_input(true)
	interaction_available.emit()
	if %robotroto.arreglado == false:
		if VariablesGlobales.multijugador:
			VariablesGlobales.playtts(acercar_pared_multi_roto,%TTS)
			 
			#VariablesGlobales.tts_habla("El ser metálico está acercándose a una pared llena de botones y cables, pero no parece prestarle atención, me pregunto si puede verla.", 1)
		else:
			VariablesGlobales.playtts(acercar_pared_single_roto,%TTS)
			 
			#VariablesGlobales.tts_habla("Hay un panel lleno de botones y cables en la pared.", 1)
	else:
		if VariablesGlobales.multijugador:
			VariablesGlobales.playtts(acercar_pared_multi,%TTS)
			 
			#VariablesGlobales.tts_habla("Nos acercamos a una pared llena de botones y cables.", 1)
		else:
			VariablesGlobales.playtts(acercar_pared_single,%TTS)
			 
			#VariablesGlobales.tts_habla("Hay un panel lleno de botones y cables en la pared.", 1)
	pass # Replace with function body.




func _on_area_exited(_area: Area2D) -> void:
	
	set_process_unhandled_input(false)
	interaction_unavailable.emit()
	if !multijugador:
		VariablesGlobales.playtts(alejar_pared_single,%TTS)
		 
		#VariablesGlobales.tts_habla("Me alejo de la pared", 0)
	else:
		if %robotroto.arreglado == true:
			VariablesGlobales.playtts(alejar_pared_multi_arreglado,%TTS)
			 
			#VariablesGlobales.tts_habla("Nos alejamos de la pared.", 0)
		else:
			VariablesGlobales.playtts(alejar_pared_multi_roto,%TTS)
			 
			#VariablesGlobales.tts_habla("Parece que se aleja.", 0)


func _on_interacted() -> void:
	if %robotroto.arreglado == true:
		if !VariablesGlobales.multijugador:
			VariablesGlobales.playtts(abrir_ruta_multi,%TTS)
			 
			#VariablesGlobales.tts_habla("El artefacto se ha iluminado y el panel ha revelado una gruta, voy a revisar qué hay más allá.", 1)
		else:
			VariablesGlobales.playtts(abrir_ruta_single,%TTS)
			 
			#VariablesGlobales.tts_habla("Ayudando al robot, consigue introducir un código y la pared se abre, revelando una gruta, vamos a revisar qué hay más allá.", 1)
		activado = true
	else:
		if VariablesGlobales.multijugador:
			VariablesGlobales.playtts(revisar_ruta_multi,%TTS)
			 
			#VariablesGlobales.tts_habla("El robot está revisando erráticamente la zona de los cables pero no encuentra los botones.", 1)
		else:
			VariablesGlobales.playtts(revisar_ruta_single,%TTS)
			 
			#VariablesGlobales.tts_habla("Hay un panel lleno de botones y cables en la pared, no lo entiendo muy bien.", 1)

	pass # Replace with function body.
