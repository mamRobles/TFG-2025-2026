extends Area2D

signal interacted
signal interaction_available
signal interaction_unavailable

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#You'll also disable the _unhandled_input process and sync it to the interaction availability: 
	#it processes inputs when an interaction is available and doesn't otherwise. 
	set_process_unhandled_input(false)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("use"):
		interacted.emit()
		$musicapiano.play()
		get_viewport().set_input_as_handled()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_interacted() -> void:
	pass # Replace with function body.


func _on_area_entered(area: Area2D) -> void:
	print("ha entrado")
	set_process_unhandled_input(true)
	interaction_available.emit()


func _on_area_exited(area: Area2D) -> void:
	set_process_unhandled_input(false)
	interaction_unavailable.emit()
