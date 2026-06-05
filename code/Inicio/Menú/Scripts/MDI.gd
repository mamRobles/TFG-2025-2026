extends Control
const menu_inicio = preload("res://Juego/sonidos/wavs/menudeinicio.wav")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	VariablesGlobales.playtts(menu_inicio, $TTS)
	await($TTS.finished)
	#VariablesGlobales.tts_habla("Menú de Inicio",0)
	$VBoxContainer/Inicio.grab_focus()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
