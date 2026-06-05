extends Control
#izquierda derecha abajo
const explicacion_salas_single = preload("res://Juego/sonidos/wavs/explicacion_salas_single.wav")
const izquierda_salas_single = preload("res://Juego/sonidos/wavs/izquierda_salas_single.wav")
const arriba_salas_single = preload("res://Juego/sonidos/wavs/arriba_salas_single.wav")
const der_salas_single = preload("res://Juego/sonidos/wavs/der_salas_single.wav")
const avanzo_turquesa = preload("res://Juego/sonidos/wavs/avanzo_turquesa.wav")
const avanzo_madera = preload("res://Juego/sonidos/wavs/avanzo_madera.wav")
const fin_salas_single = preload("res://Juego/sonidos/wavs/fin_salas_single.wav")
const avanzo_borgonia = preload("res://Juego/sonidos/wavs/avanzo_borgonia.wav")

var area:int = 1 # define el área donde está el jugador para definir la música
# area 1 - > sonido de area 1 y así
# area 4 -> triángulo

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MarginContainer/HBoxContainer/izq.grab_focus()
	VariablesGlobales.playtts(explicacion_salas_single,%TTS)
	 
	#VariablesGlobales.tts_habla("En este juego hay tres botones que identifican los tres caminos por los que ir.",0)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("exit"):
		get_tree().change_scene_to_file("res://Juego/scenes/Mapa.tscn")
	match area:
		1:
			if !$area1.playing:
				$area1.play()
		2:
			if !$area2.playing:
				$area2.play()
		3:
			if !$area3.playing:
				$area3.play()


func _on_izq_focus_entered() -> void:
	VariablesGlobales.playtts(izquierda_salas_single,%TTS)
	 
	#VariablesGlobales.tts_habla("Hacia la izquierda hay un camino azul turquesa, las baldosas son redondas.", 1)
	pass # Replace with function body.


func _on_arriba_focus_entered() -> void:
	VariablesGlobales.playtts(arriba_salas_single,%TTS)
	 
	#VariablesGlobales.tts_habla("Hacia arriba hay un camino de madera de caoba.", 1)
	pass # Replace with function body.


func _on_der_focus_entered() -> void:
	VariablesGlobales.playtts(der_salas_single,%TTS)
	 
	#VariablesGlobales.tts_habla("Hacia la derecha hay un camino de losetas coloridas rectangulares, llenas de luces led.", 1)
	pass # Replace with function body.


func _on_izq_pressed() -> void:
	VariablesGlobales.playtts(avanzo_turquesa,%TTS)
	 
	#VariablesGlobales.tts_habla("Avanzo por el camino turquesa.", 1)
	if area == 1:
		area=2
		$area1.stop()
	else:
		area = 1
		$area1.stop()
		$area2.stop()
		$area3.stop()
	pass # Replace with function body.


func _on_arriba_pressed() -> void:
	VariablesGlobales.playtts(avanzo_madera,%TTS)
	 
	#VariablesGlobales.tts_habla("Avanzo por el camino de madera.", 1)
	if area == 3:
		area=4
		$area3.stop()
		VariablesGlobales.playtts(fin_salas_single,%TTS)
		 
		#VariablesGlobales.tts_habla("He llegado al final del laberinto y en el suelo hay un extraño triángulo, voy a cogerlo. Debería volver a la cueva.", 1)
		VariablesGlobales.triangulo= true
	else:
		area = 1
		$area1.stop()
		$area2.stop()
		$area3.stop()
	pass # Replace with function body.


func _on_der_pressed() -> void:
	VariablesGlobales.playtts(avanzo_borgonia,%TTS)
	 
	#VariablesGlobales.tts_habla("Avanzo por el camino borgoña.", 1)
	if area == 2:
		area=3
		$area2.stop()
	else:
		area = 1
		$area1.stop()
		$area2.stop()
		$area3.stop()
	pass # Replace with function body.
