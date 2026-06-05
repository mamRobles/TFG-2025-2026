extends Control

var exito = false
signal esperando
const tutorial_pesca_single = preload("res://Juego/sonidos/wavs/tutorial_pesca_single.wav")
const tutorial_pesca_multi = preload("res://Juego/sonidos/wavs/tutorial_pesca_multi.wav")
const exito_pesca_multi = preload("res://Juego/sonidos/wavs/exito_pesca_multi.wav")
const exito_pesca_single = preload("res://Juego/sonidos/wavs/exito_pesca_single.wav")
const fallo_pesca_multi = preload("res://Juego/sonidos/wavs/fallo_pesca_multi.wav")
const fallo_pesca_single = preload("res://Juego/sonidos/wavs/fallo_pesca_single.wav")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if VariablesGlobales.multijugador:
		VariablesGlobales.playtts(tutorial_pesca_multi,%TTS)
		 
		#VariablesGlobales.tts_habla("Cuando pique, tengo que avisar al robot para que recoga el sedal.", 0)
	else:
		VariablesGlobales.playtts(tutorial_pesca_single,%TTS)
		 
		#VariablesGlobales.tts_habla("Cuando pique, tengo que recoger el sedal.", 0)
	emit_signal("esperando")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_pressed("exit"):
		get_tree().change_scene_to_file("res://Juego/scenes/Mapa.tscn")
		
func _input(event):
	if event.is_action_pressed("interact"):
		if !$temporizadorPesca.is_stopped():
			$temporizadorPesca.stop()
			$exito.play()
			exito = true
			VariablesGlobales.triangulo2=true
			if VariablesGlobales.multijugador:
				VariablesGlobales.playtts(exito_pesca_multi,%TTS)
				 
				#VariablesGlobales.tts_habla("Hemos pescado el pez y en su aleta tenía un extraño triángulo, me pregunto para qué servirá.", 0)
			else:
				VariablesGlobales.playtts(exito_pesca_single,%TTS)
				 
				#VariablesGlobales.tts_habla("He pescado el pez y en su aleta tenía un extraño triángulo, me pregunto para qué servirá.", 0)
			#indicador de exito para ir al puzle de salas
	
func _on_temporizador_pesca_timeout() -> void:
	$fracaso.play()
	if VariablesGlobales.multijugador:
		VariablesGlobales.playtts(fallo_pesca_multi,%TTS)
		 
		#VariablesGlobales.tts_habla("Al robot se le ha escapado el pez, lo intentamos otra vez.", 0)
	else:
		VariablesGlobales.playtts(fallo_pesca_single,%TTS)
		 
		#VariablesGlobales.tts_habla("Se ha escapado el pez, tengo que recoger el sedal más rápido.", 0)
	emit_signal("esperando")
	$temporizadorPesca.stop()
	pass # Replace with function body.
	
func _on_esperando() -> void:
	var temporizadorRuido
	if VariablesGlobales.multijugador:
		temporizadorRuido = get_tree().create_timer(randf_range(6, 9))
	else:
		temporizadorRuido = get_tree().create_timer(randf_range(4, 7))
	await temporizadorRuido.timeout
	$ruido.play()
	$temporizadorPesca.start()
	
	pass # Replace with function body.

func _on_pescado() -> void:
	
	pass # Replace with function body.
