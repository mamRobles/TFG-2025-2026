extends Node
const tutorial_movimiento = preload("res://Juego/sonidos/wavs/tutorial_movimiento.wav")
const tutorial_objeto = preload("res://Juego/sonidos/wavs/tutorial_objeto.wav")


@export var tamx = 800
@export var tamy = 200
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	VariablesGlobales.tts_para()
	if VariablesGlobales.multijugador:
		$singleplayer.visible = false
		$singleplayer/camarasingleplayer.enabled = false
		$tinte.visible = true
		$fondo.visible = true
		$Jugador/luzjugador.visible = true
	else:
		$singleplayer.visible = true
		$singleplayer/camarasingleplayer.enabled = true
		$tinte.visible = false
		$fondo.visible = false
		$Jugador/luzjugador.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if !VariablesGlobales.tutorial_movimiento:
		if !VariablesGlobales.multijugador:
			VariablesGlobales.playtts(tutorial_movimiento,%TTS)
			#VariablesGlobales.tts_habla("Para mover al topo, puedes usar las flechas del teclado o el joystick izquierdo.", 1)
		if VariablesGlobales.multijugador:
			%tutorial_mov.visible=true
			$Jugador/tutorial_mov/VBoxContainer/Entendido.grab_focus()
		VariablesGlobales.tutorial_movimiento = true
		pass
	pass


func _on_entendido_pressed() -> void:
	%tutorial_mov.visible=false
	pass # Replace with function body.


func _on_tutorial_int_area_entered(_area: Area2D) -> void:
	if VariablesGlobales.tutorial_interactuar == false:
		if !VariablesGlobales.multijugador:
			VariablesGlobales.playtts(tutorial_objeto,%TTS)
			#VariablesGlobales.tts_habla("Si te encuentras un objeto, puedes interactuar con la tecla enter o el botón de acción abajo del mando",1)
		VariablesGlobales.tutorial_interactuar = true
		if VariablesGlobales.multijugador:
			%tutorial_interactuar.visible = true
			$Jugador/tutorial_interactuar/VBoxContainer/Entendido2.grab_focus()






func _on_tutorial_mov_visibility_changed() -> void:
	$Jugador/tutorial_mov/VBoxContainer/Entendido.grab_focus()
	


func _on_tutorial_interactuar_visibility_changed() -> void:
	$Jugador/tutorial_interactuar/VBoxContainer/Entendido2.grab_focus()


func _on_entendido_2_pressed() -> void:
	%tutorial_interactuar.visible=false
