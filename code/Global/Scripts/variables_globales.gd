extends Node
var user_prefs: UserPrefs
var posx = 0 # define el x y el y para el sonar de mapa
var posy = 0

var piano_resuelto =false
var artefacto = false # si no lo tiene no suena la ubicación del mapa
var fusible = false # si no lo tiene no puede arreglar el robot/artefacto
var llave = false # si no la tienes no puedes desbloquear la puerta
var cania = false # si no tienes la caña no puedes pescar en el lago
var triangulo = false # necesario para el fin del juego, resultado del puzle de las salas
var triangulo2 = false # necesario para el fin del juego, resultado del puzle de pesca
var puerta = false # puerta abierta o cerrada con la llave
var voices 
var voz_acciones:int # dice los comandos
var voz_menus:int # dice los menús
var voice_id 
var vol_tts = 50
var multijugador = true # si es true, es multijugador, sino es singleplayer

var ultimo_hablado = 0 # si es 0 es menus si es 1 es acciones, solo para voces si es acciones
# flags de tutoriales
var tutorial_movimiento = false
var tutorial_colision = false
var tutorial_interactuar = false
var tutorial_sonar = false

const TTS_BUS_NAME = "bus_TTS"

@onready var tts_bus_index = AudioServer.get_bus_index(TTS_BUS_NAME)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	user_prefs = UserPrefs.load_or_create()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func recibir_voces() -> void:
	voices = DisplayServer.tts_get_voices_for_language("es")
	voz_acciones=user_prefs.voz_acciones
	if user_prefs.voz_acciones== TYPE_NIL:
		voz_acciones = 0
	voz_menus=user_prefs.voz_menus
	if user_prefs.voz_menus== TYPE_NIL:
		voz_menus = 0
	voice_id = voices[0]
	
func tts_estahablando() ->bool:
	return DisplayServer.tts_is_speaking()	
# id ->
#	0: menus
#	1: acciones

func cambiar_voz(id:int, voz:int )-> void:
	if id==0:
		voz_menus = voz
		user_prefs.voz_menus=voz
	else:
		pass
		#voz_acciones =voz
		#user_prefs.voz_acciones =voz
func tts_pausa(accion:bool) ->void:
	if accion == true:
		DisplayServer.tts_pause()
	else:
		DisplayServer.tts_resume()
func tts_para()-> void:
	DisplayServer.tts_stop()
# id ->
#	0: menus
#	1: acciones
#	2: prueba de voz
func tts_habla(texto:String, id:int, voz:int = 0) -> void:
	DisplayServer.tts_speak("No reemplazado", voices[voz_menus], vol_tts)
	#match id:
		#0:
			#DisplayServer.tts_speak(texto, voices[voz_menus], vol_tts)
		#1:
			#if ultimo_hablado == 1:
				#VariablesGlobales.tts_para()
			#DisplayServer.tts_speak(texto, voices[voz_menus], vol_tts)
		#2:
			#if ultimo_hablado == 1 or ultimo_hablado==2:
				#VariablesGlobales.tts_para()
			#DisplayServer.tts_speak(texto, voices[voz], vol_tts)
		
	#ultimo_hablado=id
func play_tts(stream: AudioStream, position: Vector2 = Vector2.ZERO):
	var player: Node
	if position == Vector2.ZERO:
		player = AudioStreamPlayer.new()
	else:
		player = AudioStreamPlayer2D.new()
		player.global_position = position

	player.stream = stream
	player.bus = TTS_BUS_NAME
	add_child(player)
	player.play()
	player.finished.connect(func(): player.queue_free())
func playtts(stream: AudioStream, reproductor) ->void:
	reproductor.stream=stream
	reproductor.play()
