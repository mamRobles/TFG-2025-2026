extends Node
const  pantalla_carga = preload("res://Juego/sonidos/wavs/pantallacarga.wav")

var info  =false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	%Label.text= "cargando tts"
	
	VariablesGlobales.recibir_voces()
	#no hace falta a no ser que tenga que cargar más cosas
	#VariablesGlobales.tts_habla(%Label.text,1)
	%ProgressBar.value = 100.0
	$Control/MarginContainer/mandoteclado.visible = true
	$Control/MarginContainer/PanelContainer.visible =false
	if !info:
		VariablesGlobales.playtts(pantalla_carga, $TTS)
		#await($TTS.finished)
		#VariablesGlobales.tts_habla("Este juego se puede jugar con mando o teclado",0)
		info =true
	
	var temporizador = get_tree().create_timer(6)
	await temporizador.timeout
	get_tree().change_scene_to_file("res://Inicio/Menú/Scenes/menúInicio.tscn")
	
	pass

	
