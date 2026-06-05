extends Area2D

var musica:bool =false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if(musica and !$area3.playing):
		$area3.playing = true


func _on_area_entered(_area: Area2D) -> void:
	musica =true

func _on_area_exited(_area: Area2D) -> void:
	$area3.stop()
	musica =false
