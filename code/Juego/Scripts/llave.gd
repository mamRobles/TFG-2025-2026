extends Area2D

signal interacted
signal interaction_available
signal interaction_unavailable
const llave_yarecogida_multi = preload("res://Juego/sonidos/wavs/llave_yarecogida_multi.wav")
const llave_yarecogida_single = preload("res://Juego/sonidos/wavs/llave_yarecogida_single.wav")
const llave_suelo = preload("res://Juego/sonidos/wavs/llave_suelo.wav")
const alejar_llave_multi = preload("res://Juego/sonidos/wavs/alejar_llave_multi.wav")
const alejar_llave_single = preload("res://Juego/sonidos/wavs/alejar_llave_single.wav")
const llevar_llave_multi = preload("res://Juego/sonidos/wavs/llevar_llave_multi.wav")
const llevar_llave_single = preload("res://Juego/sonidos/wavs/llevar_llave_single.wav")

var recogido =false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process_unhandled_input(false)
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and !recogido:
		interacted.emit()
		get_viewport().set_input_as_handled()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_area_entered(_area: Area2D) -> void:
	if recogido:
		if VariablesGlobales.multijugador:
			VariablesGlobales.playtts(llave_yarecogida_multi,%TTS)
			#VariablesGlobales.tts_habla("Ya recogimos la llave", 1)
		else:
			VariablesGlobales.playtts(llave_yarecogida_single,%TTS)
			#VariablesGlobales.tts_habla("Ya recogí la llave", 1)
		
	else:
		set_process_unhandled_input(true)
		interaction_available.emit()
		VariablesGlobales.playtts(llave_suelo,%TTS)
		#VariablesGlobales.tts_habla("En el suelo hay una llave", 1)



func _on_area_exited(_area: Area2D) -> void:
	if !recogido:
		set_process_unhandled_input(false)
		interaction_unavailable.emit()
		if VariablesGlobales.multijugador:
			VariablesGlobales.playtts(alejar_llave_multi,%TTS)
			#VariablesGlobales.tts_habla("Nos alejamos de la llave", 1)
		else:
			VariablesGlobales.playtts(alejar_llave_single,%TTS)
			#VariablesGlobales.tts_habla("Me alejo de la llave", 1)


func _on_interacted() -> void:
	if VariablesGlobales.multijugador:
		VariablesGlobales.playtts(llevar_llave_multi,%TTS)
		#VariablesGlobales.tts_habla("Vamos a llevarnos la llave", 1)
	else:
		VariablesGlobales.playtts(llevar_llave_single,%TTS)
		#VariablesGlobales.tts_habla("Voy a llevarme la llave", 1)
	
	VariablesGlobales.llave=true
	$Sprite2D.visible = false
	recogido = true
	pass # Replace with function body.
