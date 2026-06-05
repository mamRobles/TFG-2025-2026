extends Button
const  boton_inicio = preload("res://Juego/sonidos/wavs/botoninicio.wav")
const presionado_inicio = preload("res://Juego/sonidos/wavs/presionadoInicio.wav")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_focus_entered() -> void:
	
	VariablesGlobales.playtts(boton_inicio, $"../../TTS")
	await($"../../TTS".finished)
	#VariablesGlobales.tts_habla(text, 1)
	pass # Replace with function body.


func _on_pressed() -> void:
	VariablesGlobales.playtts(presionado_inicio, $"../../TTS")
	await($"../../TTS".finished)
	#VariablesGlobales.tts_habla("Presionado" +text,1)
	get_tree().change_scene_to_file("res://Juego/scenes/ConfigInicial.tscn")
	pass # Replace with function body.
