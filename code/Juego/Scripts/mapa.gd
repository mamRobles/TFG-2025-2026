extends Node

@export var tamx = 900
@export var tamy = 800
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
	if VariablesGlobales.puerta:
		$infopuerta.queue_free()
	if VariablesGlobales.llave:
		$llave.queue_free()

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
