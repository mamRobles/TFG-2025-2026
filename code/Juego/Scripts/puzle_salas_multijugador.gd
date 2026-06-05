extends Node2D

const intro_salas_multi = preload("res://Juego/sonidos/wavs/intro_salas_multi.wav")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Jugador.global_position = Vector2(81.0, 68.0)
	VariablesGlobales.playtts(intro_salas_multi,%TTS)
	 
	#VariablesGlobales.tts_habla("Hemos llegado a unas salas con sonidos extraños, deberíamos colaborar para encontrar el final.", 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("exit"):
		get_tree().change_scene_to_file("res://Juego/scenes/Mapa.tscn")


func _on_area_1d_area_entered(area: Area2D) -> void:
	$Jugador.global_position = Vector2(81.0, 68.0) # teleport to 


func _on_area_1a_area_entered(area: Area2D) -> void:
	$Jugador.global_position = Vector2(81.0, 68.0) # teleport to 


func _on_area_1i_area_entered(area: Area2D) -> void:
	##correcta area 1
	$Jugador.global_position = Vector2(624.0, 68.0) # teleport to


func _on_area_2d_area_entered(area: Area2D) -> void:
	#correcta area 2
	$Jugador.global_position = Vector2(351.0, 363.0) # teleport to 


func _on_area_2a_area_entered(area: Area2D) -> void:
	$Jugador.global_position = Vector2(81.0, 68.0) # teleport to  inicio


func _on_area_2i_area_entered(area: Area2D) -> void:
	$Jugador.global_position = Vector2(81.0, 68.0) # teleport to  inicio


func _on_area_3d_area_entered(area: Area2D) -> void:
	$Jugador.global_position = Vector2(81.0, 68.0) # teleport to  inicio
	
func _on_area_3i_area_entered(area: Area2D) -> void:
	$Jugador.global_position = Vector2(81.0, 68.0) # teleport to  inicio


func _on_area_3a_area_entered(area: Area2D) -> void:
	#correcta area 3
	$Jugador.global_position = Vector2(707.0, 465.0)
	
