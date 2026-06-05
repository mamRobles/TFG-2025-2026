extends Button
const no = preload("res://Juego/sonidos/wavs/no.wav")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass



func _on_focus_entered() -> void:
	VariablesGlobales.playtts(no, %TTS)
	await(%TTS.finished)
	#VariablesGlobales.tts_habla(text,1)
	pass # Replace with function body.
