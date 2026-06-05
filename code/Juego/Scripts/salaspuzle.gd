extends Area2D
signal interacted
signal interaction_available
signal interaction_unavailable
var nota:int = 0
var musica:bool =false
const salas_cerradas = preload("res://Juego/sonidos/wavs/salas_cerradas.wav")
const salas_desc = preload("res://Juego/sonidos/wavs/salas_desc.wav")
const alejar_salas_multi = preload("res://Juego/sonidos/wavs/alejar_salas_multi.wav")
const alejar_salas_single = preload("res://Juego/sonidos/wavs/alejar_salas_single.wav")
const ya_resuelto_salas_multi = preload("res://Juego/sonidos/wavs/ya_resuelto_salas_multi.wav")
const ya_resuelto_salas_single = preload("res://Juego/sonidos/wavs/ya_resuelto_salas_single.wav")
const adentrar_salas_multi = preload("res://Juego/sonidos/wavs/adentrar_salas_multi.wav")
const adentrar_salas_single = preload("res://Juego/sonidos/wavs/adentrar_salas_single.wav")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process_unhandled_input(false)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		get_viewport().set_input_as_handled()
		interacted.emit()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_area_entered(_area: Area2D) -> void:
	set_process_unhandled_input(true)
	interaction_available.emit()
	if VariablesGlobales.triangulo:
		VariablesGlobales.playtts(salas_cerradas, %TTS)
		 
		#VariablesGlobales.tts_habla("Las salas se han cerrado",1)
	else:
		VariablesGlobales.playtts(salas_desc, %TTS)
		 
		#VariablesGlobales.tts_habla("Aquí hay un puzle de salas.",1)


func _on_area_exited(_area: Area2D) -> void:
	if !VariablesGlobales.triangulo:
		if VariablesGlobales.multijugador:
			VariablesGlobales.playtts(alejar_salas_multi, %TTS)
			 
			#VariablesGlobales.tts_habla("Nos alejamos de las salas.",1)
		else:
			VariablesGlobales.playtts(alejar_salas_single, %TTS)
			 
			#VariablesGlobales.tts_habla("Me alejo de las salas.",1)
	set_process_unhandled_input(false)
	interaction_unavailable.emit()



func _on_interacted() -> void:
	if VariablesGlobales.triangulo:
		if VariablesGlobales.multijugador:
			VariablesGlobales.playtts(ya_resuelto_salas_multi, %TTS)
			 
			#VariablesGlobales.tts_habla("Ya hemos resuelto este puzle y tenemos el triángulo.",1)
		else:
			VariablesGlobales.playtts(ya_resuelto_salas_single, %TTS)
			 
			#VariablesGlobales.tts_habla("Ya he resuelto este puzle y tengo el triángulo.",1)
	else:
		if VariablesGlobales.multijugador:
			VariablesGlobales.playtts(adentrar_salas_multi, %TTS)
			 
			#VariablesGlobales.tts_habla("Nos adentramos en las salas.",1)
		else:
			VariablesGlobales.playtts(adentrar_salas_single, %TTS)
			 
			#VariablesGlobales.tts_habla("Voy a adentrarme en las salas.",1)
		VariablesGlobales.posx = $"../Jugador".position.x
		VariablesGlobales.posy = $"../Jugador".position.y
		if VariablesGlobales.multijugador:
			get_tree().change_scene_to_file("res://Juego/scenes/puzle_salas_multijugador.tscn")
		else:
			get_tree().change_scene_to_file("res://Juego/scenes/puzle_salas_single.tscn")
	pass
