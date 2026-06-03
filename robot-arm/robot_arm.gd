extends MeshInstance3D

@export var base_action_key: String
@export var turn_speed_degrees: float = 90.0
@export var max_angle_x_degrees = 40.0
@export var min_angle_x_degrees = -40.0

func get_turn_angle(delta: float) -> float:
	return delta * (PI / 180.0) * turn_speed_degrees

func _process(delta: float) -> void:
	var angle_x: float = 0.0
	var angle_y: float = 0.0
	
	if (Input.is_action_pressed(base_action_key + "_up")):
		angle_x += get_turn_angle(delta)
		
	if (Input.is_action_pressed(base_action_key + "_down")):
		angle_x -= get_turn_angle(delta)
		
	if (Input.is_action_pressed(base_action_key + "_left")):
		angle_y += get_turn_angle(delta)
		
	if (Input.is_action_pressed(base_action_key + "_right")):
		angle_y -= get_turn_angle(delta)
	
	var next_angle_x = rotation.x + angle_x
	next_angle_x = clampf(next_angle_x, (PI / 180.0) * min_angle_x_degrees, (PI / 180.0) * max_angle_x_degrees)
	rotation = Vector3(next_angle_x, rotation.y + angle_y, 0.0)
	pass
