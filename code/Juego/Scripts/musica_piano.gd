extends Area2D
var nota:int = 0
var musica:bool =false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if(musica):
		if !%musicapiano.is_playing() and nota == 0:
			%musicapiano.pitch_scale = 1.0
			%musicapiano.play()
			nota = 1
		if !%musicapiano.is_playing() and nota == 1:
			%musicapiano.pitch_scale = 2.0
			%musicapiano.play()
			nota = 2
			
		if !%musicapiano.is_playing() and nota == 2:
			%musicapiano.pitch_scale=0.5
			%musicapiano.play()
			nota = 0


func _on_area_entered(_area: Area2D) -> void:
	musica =true

func _on_area_exited(_area: Area2D) -> void:
	musica =false
