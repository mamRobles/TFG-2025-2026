extends Button
@onready var Conf_salir = $"../../Confirmación Salir"
const  boton_salir = preload("res://Juego/sonidos/wavs/botonsalir.wav")
const presionado_salir = preload("res://Juego/sonidos/wavs/presionadosalir.wav")
@onready var TTS = $"../../TTS"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _on_focus_entered() -> void:
	VariablesGlobales.playtts(boton_salir,TTS)
	await(TTS.finished)
	#VariablesGlobales.tts_habla(text,1)
	pass # Replace with function body.


func _on_pressed() -> void:
	VariablesGlobales.playtts(presionado_salir,TTS)
	await(TTS.finished)
	#VariablesGlobales.tts_habla("Presionado" +text,1)
	Conf_salir.visible=true
	pass # Replace with function body.
