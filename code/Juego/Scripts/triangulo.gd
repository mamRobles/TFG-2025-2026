extends Area2D

signal interacted
signal interaction_available
signal interaction_unavailable
var recogido =false
const triangulo_recogido = preload("res://Juego/sonidos/wavs/triangulo_recogido.wav")
const triangulo_recogible = preload("res://Juego/sonidos/wavs/triangulo_recogible.wav")
const triangulo_alejar = preload("res://Juego/sonidos/wavs/triangulo_alejar.wav")
const triangulo_llevar = preload("res://Juego/sonidos/wavs/triangulo_llevar.wav")

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
		VariablesGlobales.playtts(triangulo_recogido,%TTS)
		 
		#VariablesGlobales.tts_habla("Ya recogí el triángulo, debería irme", 0)
	else:
		set_process_unhandled_input(true)
		interaction_available.emit()
		VariablesGlobales.playtts(triangulo_recogible,%TTS)
		 
		#VariablesGlobales.tts_habla("En el suelo hay un triángulo", 0)



func _on_area_exited(_area: Area2D) -> void:
	if !recogido:
		set_process_unhandled_input(false)
		interaction_unavailable.emit()
		VariablesGlobales.playtts(triangulo_alejar,%TTS)
		 
		#VariablesGlobales.tts_habla("Me alejo del triángulo", 0)


func _on_interacted() -> void:
	VariablesGlobales.playtts(triangulo_llevar,%TTS)
	 
	#VariablesGlobales.tts_habla("Voy a llevarme el triángulo", 0)
	VariablesGlobales.triangulo=true
	$Sprite2D.visible = false
	recogido = true
	pass # Replace with function body.
