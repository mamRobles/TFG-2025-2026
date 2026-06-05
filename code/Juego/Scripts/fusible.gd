extends Area2D

signal interacted
signal interaction_available
signal interaction_unavailable
var recogido =false
var multijugador = VariablesGlobales.multijugador
const fusible_recogido_single = preload("res://Juego/sonidos/wavs/fusible_recogido_single.wav")
const fusible_recogido_multi = preload("res://Juego/sonidos/wavs/fusible_recogido_multi.wav")
const fusible_suelo_single = preload("res://Juego/sonidos/wavs/fusible_suelo_single.wav")
const fusible_suelo_multi = preload("res://Juego/sonidos/wavs/fusible_suelo_multi.wav")
const alejar_fusible_single = preload("res://Juego/sonidos/wavs/alejar_fusible_single.wav")
const alejar_fusible_multi = preload("res://Juego/sonidos/wavs/alejar_fusible_multi.wav")
const llevar_fusible_single = preload("res://Juego/sonidos/wavs/llevar_fusible_single.wav")
const llevar_fusible_multi = preload("res://Juego/sonidos/wavs/llevar_fusible_multi.wav")

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
		if !multijugador:
			VariablesGlobales.playtts(fusible_recogido_single, %TTS)
			 
			#VariablesGlobales.tts_habla("Ya recogí el fusible", 0)
		else:
			VariablesGlobales.playtts(fusible_recogido_multi, %TTS)
			 
			#VariablesGlobales.tts_habla("Está otra vez en la misma zona del fusible, me pregunto qué hace.", 0)
	else:
		set_process_unhandled_input(true)
		interaction_available.emit()
		if !multijugador:
			VariablesGlobales.playtts(fusible_suelo_single, %TTS)
			 
			#VariablesGlobales.tts_habla("En el suelo hay un fusible.", 0)
		else:
			VariablesGlobales.playtts(fusible_suelo_multi, %TTS)
			 
			#VariablesGlobales.tts_habla("Alguien está explorando al fondo de la sala.", 0)



func _on_area_exited(_area: Area2D) -> void:
	if !recogido:
		set_process_unhandled_input(false)
		interaction_unavailable.emit()
		if !multijugador:
			VariablesGlobales.playtts(alejar_fusible_single, %TTS)
			 
			#VariablesGlobales.tts_habla("Me alejo del fusible", 0)
		else:
			VariablesGlobales.playtts(alejar_fusible_multi, %TTS)
			 
			#VariablesGlobales.tts_habla("Parece que se aleja.", 0)


func _on_interacted() -> void:
	if !multijugador:
		VariablesGlobales.playtts(llevar_fusible_single, %TTS)
		 
		#VariablesGlobales.tts_habla("Voy a llevarme el fusible", 0)
	else:
		VariablesGlobales.playtts(llevar_fusible_multi, %TTS)
		 
		#VariablesGlobales.tts_habla("Está recogiendo algo del suelo, me pregunto qué será.", 0)
	VariablesGlobales.fusible=true
	$Sprite2D.visible = false
	recogido = true
	pass # Replace with function body.
