extends OptionButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var contador = 0
	var maximo = VariablesGlobales.voices.size()
	
	while contador<maximo:
		add_item("voz"+str(contador),contador)
		contador= contador +1
	select(VariablesGlobales.voz_menus)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_focus_entered() -> void:
	VariablesGlobales.tts_habla($"../TTS_voces_menu".text, 0)


func _on_item_focused(index: int) -> void:
	VariablesGlobales.tts_habla("Probando voz de menus",2,index)
	pass # Replace with function body.


func _on_item_selected(index: int) -> void:
	VariablesGlobales.cambiar_voz(0,index)
	VariablesGlobales.tts_habla("Gracias por seleccionarme",0)
	pass # Replace with function body.
