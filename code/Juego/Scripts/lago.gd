extends Area2D
signal interacted
signal interaction_available
signal interaction_unavailable
var nota:int = 0
var musica:bool =false
const llegar_lago_multi = preload("res://Juego/sonidos/wavs/llegar_lago_multi.wav")
const llegar_lago_single = preload("res://Juego/sonidos/wavs/llegar_lago_single.wav")
const ver_pez_multi = preload("res://Juego/sonidos/wavs/ver_pez_multi.wav")
const ver_pez_single = preload("res://Juego/sonidos/wavs/ver_pez_single.wav")
const intentar_pescar_multi = preload("res://Juego/sonidos/wavs/intentar_pescar_multi.wav")
const intentar_pescar_single = preload("res://Juego/sonidos/wavs/intentar_pescar_single.wav")
const ya_pescado_multi = preload("res://Juego/sonidos/wavs/ya_pescado_multi.wav")
const ya_pescado_single = preload("res://Juego/sonidos/wavs/ya_pescado_single.wav")


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
	if(musica and !$musicapiano.playing):
		$musicapiano.playing = true


func _on_area_entered(_area: Area2D) -> void:
	musica =true
	set_process_unhandled_input(true)
	interaction_available.emit()
	if VariablesGlobales.multijugador:
		VariablesGlobales.playtts(llegar_lago_multi, %TTS)
		#VariablesGlobales.tts_habla("Hemos llegado a la orilla de un lago subterráneo.",1)
	else:
		VariablesGlobales.playtts(llegar_lago_single, %TTS)
		#VariablesGlobales.tts_habla("He llegado a la orilla de un lago subterráneo.",1)
func _on_area_exited(_area: Area2D) -> void:
	set_process_unhandled_input(false)
	interaction_unavailable.emit()
	$musicapiano.stop()
	musica =false


func _on_interacted() -> void:
	if !VariablesGlobales.triangulo2:
		if !VariablesGlobales.cania:
			if VariablesGlobales.multijugador:
				VariablesGlobales.playtts(ver_pez_multi, %TTS)
				#VariablesGlobales.tts_habla("Parece que en el lago hay un pez, me pregunto si podríamos pescarlo.",1)
			else:
				VariablesGlobales.playtts(ver_pez_single, %TTS)
				#VariablesGlobales.tts_habla("Parece que en el lago hay un pez, me pregunto si podría pescarlo.",1)
		else:
			if VariablesGlobales.multijugador:
				VariablesGlobales.playtts(intentar_pescar_multi, %TTS)
				#VariablesGlobales.tts_habla("Vamos a intentar pescar el pez.",1)
			else:
				VariablesGlobales.playtts(intentar_pescar_single, %TTS)
				#VariablesGlobales.tts_habla("Voy a intentar pescar el pez.",1)
			VariablesGlobales.posx = $"../Jugador".position.x
			VariablesGlobales.posy = $"../Jugador".position.y
			
			get_tree().change_scene_to_file("res://Juego/scenes/pesca.tscn")
	else:
		if VariablesGlobales.multijugador:
			VariablesGlobales.playtts(ya_pescado_multi, %TTS)
			#VariablesGlobales.tts_habla("Ya hemos pescado el pez del lago y tenemos el triángulo.",0)
		else:
			VariablesGlobales.playtts(ya_pescado_single, %TTS)
			#VariablesGlobales.tts_habla("Ya he pescado el pez del lago y tengo el triángulo.",0)
