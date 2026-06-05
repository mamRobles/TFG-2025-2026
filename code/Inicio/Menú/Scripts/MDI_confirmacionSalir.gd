extends PanelContainer
const seguro_salir = preload("res://Juego/sonidos/wavs/seguro_salir.wav")
const menu_principal = preload("res://Juego/sonidos/wavs/menu_principal.wav")

@onready var Boton_salir = $"../VBoxContainer/Salir"
@onready var Boton_opciones = $"../VBoxContainer/Opciones"
@onready var Boton_inicio = $"../VBoxContainer/Inicio"

@onready var Conf_si = $VBoxContainer/VBoxContainer2/Si
@onready var Conf_no = $VBoxContainer/VBoxContainer2/No
@onready var Conf_texto = $VBoxContainer/Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	VariablesGlobales.playtts(seguro_salir,%TTS)
	await(%TTS.finished)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_visibility_changed() -> void:
	if is_visible_in_tree():
		# Desactivamos los botones del menú principal cuando buscamos confirmación 
		Boton_salir.visible=false
		
		Boton_opciones.visible=false
		Boton_inicio.visible=false
		Conf_si.grab_focus()


func _on_no_pressed() -> void:
	VariablesGlobales.playtts(menu_principal,%TTS)
	await(%TTS.finished)
	#VariablesGlobales.tts_habla("Menú principal", 0)
	visible=false
	Boton_salir.visible=true
	Boton_opciones.visible=true
	Boton_inicio.visible=true
	Boton_inicio.grab_focus()
	pass # Replace with function body.
