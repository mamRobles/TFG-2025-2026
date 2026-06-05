extends Area2D

signal interacted
signal interaction_available
signal interaction_unavailable
const piano_resuelto_mapa = preload("res://Juego/sonidos/wavs/piano_resuelto_mapa.wav")
const piano_mapa = preload("res://Juego/sonidos/wavs/piano_mapa.wav")
const alejar_piano_roto = preload("res://Juego/sonidos/wavs/alejar_piano_roto.wav")
const alejar_piano = preload("res://Juego/sonidos/wavs/alejar_piano.wav")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#You'll also disable the _unhandled_input process and sync it to the interaction availability: 
	#it processes inputs when an interaction is available and doesn't otherwise. 
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
	if VariablesGlobales.piano_resuelto:
		VariablesGlobales.cania=true
		VariablesGlobales.playtts(piano_resuelto_mapa,%TTS)
		 
		#VariablesGlobales.tts_habla("El piano se ha roto, ya no suena.", 1)
	else:
		set_process_unhandled_input(true)
		interaction_available.emit()
		VariablesGlobales.playtts(piano_mapa,%TTS)
		 
		#VariablesGlobales.tts_habla("Parece que aquí hay un viejo piano.",1)
	pass # Replace with function body.


func _on_area_exited(_area: Area2D) -> void:
	if VariablesGlobales.piano_resuelto:
		VariablesGlobales.playtts(alejar_piano_roto,%TTS)
		 
		#VariablesGlobales.tts_habla("Me alejo del piano roto", 1)
	else:
		set_process_unhandled_input(false)
		interaction_unavailable.emit()
		VariablesGlobales.playtts(alejar_piano,%TTS)
		 
		#VariablesGlobales.tts_habla("Me alejo del piano",1)
	pass # Replace with function body.


func _on_interacted() -> void:
	VariablesGlobales.posx = $"../Jugador".position.x
	VariablesGlobales.posy = $"../Jugador".position.y
	
	get_tree().change_scene_to_file("res://Juego/scenes/piano.tscn")
	pass # Replace with function body.
