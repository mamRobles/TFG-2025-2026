extends CharacterBody2D
var _sprites := {Vector2.DOWN: 0, Vector2.RIGHT:1, Vector2.LEFT:2, Vector2.UP:3}
## Speed in pixels per second.
@export_range(0, 1000) var speed := 100
const JUMP_VELOCITY = -400.0
var sonidopasos
const tutorial_colision_multi = preload("res://Juego/sonidos/wavs/tutorial_colision_multi.wav")
const tutorial_colision_single = preload("res://Juego/sonidos/wavs/tutorial_colision_single.wav")


func _ready() -> void:
	if VariablesGlobales.multijugador:
		$multijugador.visible =true
		$singleplayer.visible=false
		sonidopasos=$pasosrobot
	else:
		$singleplayer.visible=true
		$multijugador.visible =false
		sonidopasos = $pasos
	if VariablesGlobales.posx != 0:
		position.x = VariablesGlobales.posx
	if VariablesGlobales.posy != 0:
		position.y = VariablesGlobales.posy
	
func get_player_input() ->void:
	var vector := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = vector * speed
	if vector!= Vector2.ZERO:
		if !sonidopasos.playing:
			sonidopasos.play()
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_right"):
		$singleplayer.frame=_sprites[Vector2.RIGHT]
		$multijugador.frame=_sprites[Vector2.RIGHT]
	if event.is_action_pressed("ui_left"):
		$singleplayer.frame=_sprites[Vector2.LEFT]
		$multijugador.frame=_sprites[Vector2.LEFT]
	if event.is_action_pressed("ui_up"):
		$singleplayer.frame=_sprites[Vector2.UP]
		$multijugador.frame=_sprites[Vector2.UP]
	if event.is_action_pressed("ui_down"):
		$singleplayer.frame=_sprites[Vector2.DOWN]
		$multijugador.frame=_sprites[Vector2.DOWN]
	
func _physics_process(_delta: float) -> void:
	get_player_input()
	move_and_slide()
	
	# si es mayor a 0 ha colisionado
	if get_slide_collision_count() > 0:
		if VariablesGlobales.tutorial_colision ==false:
			if VariablesGlobales.multijugador:
				VariablesGlobales.playtts(tutorial_colision_multi,%TTS)
				 
				#VariablesGlobales.tts_habla("Cuando el robot se choque contra una pared, escucharás un sonido de colisión.",1)
			else:
				VariablesGlobales.playtts(tutorial_colision_single,%TTS)
				 
				#VariablesGlobales.tts_habla("Cuando te choques con una pared, escucharás un sonido de colisión",0)
			VariablesGlobales.tutorial_colision = true
		$colision.play()


func _on_area_2d_interacted() -> void:
	$AudioStreamPlayer2D.pitch_scale= (position.x *3 / $"..".tamx)+0.3
	#TODO modificar distorsion del bus de sonido de mapa según y
	var efecto = AudioServer.get_bus_effect(AudioServer.get_bus_index("Mapa_SFX"), 0)
	efecto.drive = position.y*0.7 /$"..".tamy
	efecto.post_gain = position.y* -30 /$"..".tamy
	var eco = AudioServer.get_bus_effect(AudioServer.get_bus_index("Mapa_SFX"), 1)
	eco.room_size = 1.0-(position.y /$"..".tamy)
	
	if VariablesGlobales.artefacto: # solo suena si tienes el artefacto
		$AudioStreamPlayer2D.play()
	pass # Replace with function body.
