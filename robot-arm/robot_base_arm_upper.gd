extends MeshInstance3D

@export var turn_speed_degrees: float = 90.0;

func _process(delta: float) -> void:
		
	if (Input.is_action_pressed("robot_arm_upper_up")):
		rotate_x(delta * (PI / 180.0) * turn_speed_degrees)
		
	if (Input.is_action_pressed("robot_arm_upper_down")):
		rotate_x(delta * (PI / 180.0) * -turn_speed_degrees)
	
	pass
