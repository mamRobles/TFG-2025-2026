extends Button
const si = preload("res://Juego/sonidos/wavs/si.wav")
const cerrando_juego = preload("res://Juego/sonidos/wavs/cerrandojuego.wav")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_focus_entered() -> void:
	VariablesGlobales.playtts(si, %TTS)
	await(%TTS.finished)
	#VariablesGlobales.tts_habla(text,1)
	pass # Replace with function body.

func _on_pressed() -> void:
	VariablesGlobales.playtts(cerrando_juego, %TTS)
	#await($TTS.finished)
	#VariablesGlobales.tts_habla("Cerrando el juego",0)
	get_tree().quit()
	pass # Replace with function body.
