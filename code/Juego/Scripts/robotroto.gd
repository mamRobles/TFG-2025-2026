extends Area2D

signal interacted
signal interaction_available
signal interaction_unavailable
@export var arreglado = false
const artefacto_entra_multi = preload("res://Juego/sonidos/wavs/artefacto_entra_multi.wav")
const artefacto_entra_single = preload("res://Juego/sonidos/wavs/artefacto_entra_single.wav")
const artefacto_sale_multi = preload("res://Juego/sonidos/wavs/artefacto_sale_multi.wav")
const artefacto_sale_single = preload("res://Juego/sonidos/wavs/artefacto_sale_single.wav")
const tutorial_sinfusible_multi = preload("res://Juego/sonidos/wavs/tutorial_sinfusible_multi.wav")
const tutorial_sinfusible_single = preload("res://Juego/sonidos/wavs/tutorial_sinfusible_single.wav")
const tutorial_confusible_multi = preload("res://Juego/sonidos/wavs/tutorial_confusible_multi.wav")
const tutorial_confusible_single = preload("res://Juego/sonidos/wavs/tutorial_confusible_single.wav")
const tutorial_sonar = preload("res://Juego/sonidos/wavs/tutorial_sonar.wav")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process_unhandled_input(false)
	if VariablesGlobales.multijugador:
		$robot.visible =true
		$artefacto.visible = false
	else:
		$robot.visible =false
		$artefacto.visible = true
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and !arreglado:
		interacted.emit()
		get_viewport().set_input_as_handled()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_area_entered(_area: Area2D) -> void:

	if !arreglado:
		set_process_unhandled_input(true)
		interaction_available.emit()
		if VariablesGlobales.multijugador:
			VariablesGlobales.playtts(artefacto_entra_multi,%TTS)
			 
			#VariablesGlobales.tts_habla("Escucho pasos metálicos, ¿qué será?", 0)
		else:
			VariablesGlobales.playtts(artefacto_entra_single,%TTS)
			 
			#VariablesGlobales.tts_habla("Aquí hay un artefacto roto, me pregunto si podría arreglarlo",0)
	pass # Replace with function body.


func _on_area_exited(_area: Area2D) -> void:
	if !arreglado:
		set_process_unhandled_input(false)
		interaction_unavailable.emit()
		if VariablesGlobales.multijugador:
			VariablesGlobales.playtts(artefacto_sale_multi,%TTS)
			 
			#VariablesGlobales.tts_habla("Los pasos se alejan.", 0)
		else:
			VariablesGlobales.playtts(artefacto_sale_single,%TTS)
			 
			#VariablesGlobales.tts_habla("Me alejo del artefacto roto",0)
	pass # Replace with function body.


func _on_interacted() -> void:
	if !arreglado:
		if !VariablesGlobales.fusible:
			if VariablesGlobales.multijugador:
				VariablesGlobales.playtts(tutorial_sinfusible_multi,%TTS)
				 
				#VariablesGlobales.tts_habla("Las manos metálicas me inspeccionan, los ojos brillan en la oscuridad",0)
			else:
				VariablesGlobales.playtts(tutorial_sinfusible_single,%TTS)
				 
				#VariablesGlobales.tts_habla("El artefacto tiene una ranura, tal vez le falta algo. Buscaré por la zona",0)
		else:
			if VariablesGlobales.multijugador:
				VariablesGlobales.playtts(tutorial_confusible_multi,%TTS)
				 
				#VariablesGlobales.tts_habla("El robot está ayudándome, parece que quiere que le acompañe.",0)
			else:
				VariablesGlobales.playtts(tutorial_confusible_single,%TTS)
				 
				#VariablesGlobales.tts_habla("Voy a colocar el fusible",0)
			arreglado = true
			$robot.visible = false
			$artefacto.visible =false
			# aquí ha arreglado el robot, si quiero poner una explicación sería aquí
			#aquí se debe desbloquear el tp a otra zona
			if !VariablesGlobales.multijugador:
				VariablesGlobales.artefacto=true # para que suene el mapa
				VariablesGlobales.playtts(tutorial_sonar,%TTS)
				 
				#VariablesGlobales.tts_habla("Este artefacto tiene un sonar, que puedo activar con la tecla acción derecha o espacio",0)
	pass # Replace with function body.
