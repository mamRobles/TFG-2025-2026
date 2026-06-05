extends PanelContainer
const modo_juego = preload("res://Juego/sonidos/wavs/modo_juego.wav")
const va_1jugador = preload("res://Juego/sonidos/wavs/va_1jugador.wav")
const va_2jugadores = preload("res://Juego/sonidos/wavs/va_2jugadores.wav")
const boton_continuar = preload("res://Juego/sonidos/wavs/boton_continuar.wav")
const boton_atras = preload("res://Juego/sonidos/wavs/boton_atras.wav")

@onready var Continuar = $VBoxContainer/VBoxContainer/Continuar
@onready var Atras = $"VBoxContainer/VBoxContainer/Atrás"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _on_visibility_changed() -> void:
	if is_visible_in_tree():
		# Desactivamos los botones del menú principal cuando buscamos confirmación 
		$"../MarginContainer/VBoxContainer".visible = false
		if $"..".modo == 0:
			VariablesGlobales.playtts(va_1jugador,%TTS)
			await(%TTS.finished)
			#VariablesGlobales.tts_habla($VBoxContainer/Label.text, 0)
		else:
			VariablesGlobales.playtts(va_2jugadores,%TTS)
			await(%TTS.finished)
			#VariablesGlobales.tts_habla(%Modo.text, 0)
		Continuar.grab_focus()

func _on_atrás_pressed() -> void:
	VariablesGlobales.playtts(modo_juego,%TTS)
	await(%TTS.finished)
	#VariablesGlobales.tts_habla($"../MarginContainer/VBoxContainer/Label".text, 0)
	visible=false
	$"../MarginContainer/VBoxContainer".visible = true
	$"../MarginContainer/VBoxContainer/1pl".grab_focus()
	pass # Replace with function body.

func _on_continuar_pressed() -> void:
	get_tree().change_scene_to_file("res://Juego/scenes/Tutorial.tscn")#juego
	pass # Replace with function body.

func _on_continuar_focus_entered() -> void:
	VariablesGlobales.playtts(boton_continuar,%TTS)
	await(%TTS.finished)
	#VariablesGlobales.tts_habla(Continuar.text,1)

func _on_atrás_focus_entered() -> void:
	VariablesGlobales.playtts(boton_atras,%TTS)
	await(%TTS.finished)
	#VariablesGlobales.tts_habla(Atras.text,1)
	pass # Replace with function body.
