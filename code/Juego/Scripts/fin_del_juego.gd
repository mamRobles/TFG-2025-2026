extends Area2D
signal interacted
signal interaction_available
signal interaction_unavailable
var triangulo1 = false
var triangulo2 =false
var gruta = false # se ha abierto la gruta o no
const huecos_triangulos = preload("res://Juego/sonidos/wavs/huecos_triangulos.wav")
const huecos_triangulos_dos = preload("res://Juego/sonidos/wavs/huecos_triangulos_dos.wav")
const huecos_triangulos_uno = preload("res://Juego/sonidos/wavs/huecos_triangulos_uno.wav")
const alejar_pared_multi = preload("res://Juego/sonidos/wavs/alejar_pared_multi.wav")
const alejar_pared_single = preload("res://Juego/sonidos/wavs/alejar_pared_single.wav")
const interactuar_notriangulos = preload("res://Juego/sonidos/wavs/interactuar_notriangulos.wav")
const interactuar_tr1 = preload("res://Juego/sonidos/wavs/interactuar_tr1.wav")
const interactuar_tr2 = preload("res://Juego/sonidos/wavs/interactuar_tr2.wav")
const interactuar_gruta_triangulos = preload("res://Juego/sonidos/wavs/interactuar_gruta_triangulos.wav")

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
	pass


func _on_area_entered(_area: Area2D) -> void:
	set_process_unhandled_input(true)
	interaction_available.emit()
	if !triangulo1 and !triangulo2:
		VariablesGlobales.playtts(huecos_triangulos,%TTS)
		 
		#VariablesGlobales.tts_habla("En la pared noto dos huecos con forma de triángulo que forman un reloj de arena.",0)
	else:
		if !triangulo1 and triangulo2:
			VariablesGlobales.playtts(huecos_triangulos_dos,%TTS)
			 
			#VariablesGlobales.tts_habla("En la pared queda un hueco en la parte superior del reloj de arena, debajo está el triángulo colocado.",0)
		else:
			if triangulo1 and !triangulo2:
				VariablesGlobales.playtts(huecos_triangulos_uno,%TTS)
				 
				#VariablesGlobales.tts_habla("En la pared queda un hueco en la parte inferior del reloj de arena, encima está el triángulo colocado.",0)


func _on_area_exited(_area: Area2D) -> void:
	set_process_unhandled_input(false)
	interaction_unavailable.emit()
	if VariablesGlobales.multijugador:
		VariablesGlobales.playtts(alejar_pared_multi,%TTS)
		 
		#VariablesGlobales.tts_habla("Nos alejamos de la pared.",0)
	else:
		VariablesGlobales.playtts(alejar_pared_single,%TTS)
		 
		#VariablesGlobales.tts_habla("Me alejo de la pared.",0)



func _on_interacted() -> void:
	if !VariablesGlobales.triangulo and !VariablesGlobales.triangulo2:
		VariablesGlobales.playtts(interactuar_notriangulos,%TTS)
		await(%TTS.finished)
		#VariablesGlobales.tts_habla("La pared no se mueve, es sólida.",0)
	if VariablesGlobales.triangulo and !triangulo1:
		$clic.play()
		VariablesGlobales.playtts(interactuar_tr1,%TTS)
		await(%TTS.finished)
		#VariablesGlobales.tts_habla("El triángulo de las salas encaja en la parte superior del reloj de arena.",0)
		triangulo1 = true
	if VariablesGlobales.triangulo2 and !triangulo2:
		$clic.play()
		VariablesGlobales.playtts(interactuar_tr2,%TTS)
		await(%TTS.finished)
		#VariablesGlobales.tts_habla("El triángulo del pez encaja en la parte inferior del reloj de arena.",0)
		triangulo2= true
	if triangulo1 and triangulo2 and !gruta:
		$gruta.play()
		VariablesGlobales.playtts(interactuar_gruta_triangulos,%TTS)
		await(%TTS.finished)
		#VariablesGlobales.tts_habla("Al colocar ambos triángulos la pared se abre, revelando la salida del tunel.",0)
		gruta = true
		await get_tree().create_timer(5).timeout
		get_tree().change_scene_to_file("res://Juego/scenes/finJuego.tscn")
		#aqui fin
