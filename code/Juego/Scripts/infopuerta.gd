extends Area2D

signal interacted
signal interaction_available
signal interaction_unavailable
const desc_puerta_sinllave = preload("res://Juego/sonidos/wavs/desc_puerta_sinllave.wav")
const desc_puerta_conllave = preload("res://Juego/sonidos/wavs/desc_puerta_conllave.wav")
const alejar_puerta_multi = preload("res://Juego/sonidos/wavs/alejar_puerta_multi.wav")
const alejar_puerta_single = preload("res://Juego/sonidos/wavs/alejar_puerta_single.wav")
const abrir_puerta_multi = preload("res://Juego/sonidos/wavs/abrir_puerta_multi.wav")
const abrir_puerta_single = preload("res://Juego/sonidos/wavs/abrir_puerta_single.wav")


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
	pass


func _on_area_entered(_area: Area2D) -> void:
	if !VariablesGlobales.llave:
		#describimos puerta
		VariablesGlobales.playtts(desc_puerta_sinllave, %TTS)
		#VariablesGlobales.tts_habla("Hay una puerta enorme de madera con una cerradura.", 1)
	else:
		#podemos abrir puerta puerta
		set_process_unhandled_input(true)
		interaction_available.emit()
		VariablesGlobales.playtts(desc_puerta_conllave, %TTS)
		#VariablesGlobales.tts_habla("La cerradura es similar a la llave.", 1)



func _on_area_exited(_area: Area2D) -> void:
	if !VariablesGlobales.puerta:
		if VariablesGlobales.llave:
			set_process_unhandled_input(false)
			interaction_unavailable.emit()
			
		if VariablesGlobales.multijugador:
			VariablesGlobales.playtts(alejar_puerta_multi, %TTS)
			#VariablesGlobales.tts_habla("Nos alejamos de la puerta.", 1)
		else:
			VariablesGlobales.playtts(alejar_puerta_single, %TTS)
			#VariablesGlobales.tts_habla("Me alejo de la puerta.", 1)


func _on_interacted() -> void:
	if VariablesGlobales.multijugador:
		VariablesGlobales.playtts(abrir_puerta_multi, %TTS)
		#VariablesGlobales.tts_habla("Vamos a abrir la puerta con la llave", 1)
	else:
		VariablesGlobales.playtts(abrir_puerta_single, %TTS)
		#VariablesGlobales.tts_habla("Voy a abrir la puerta con la llave", 1)
	$puertaabre.play()
	VariablesGlobales.puerta = true
	queue_free()
	pass # Replace with function body.
