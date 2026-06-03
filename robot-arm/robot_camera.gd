extends Camera3D

func _unhandled_input(event: InputEvent) -> void:
	
	if (event.is_action_pressed("camera_lock")):
		top_level = not top_level
