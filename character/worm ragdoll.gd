extends Node2D

var power = 100

func _physics_process(delta):
	var axis = Input.get_action_strength("KEY_RIGHT") - Input.get_action_strength("KEY_RIGHT")
	var axis_y = Input.get_action_strength("KEY_UP") - Input.get_action_strength("KEY_UP")
	$"Segment 1".apply_impulse(Vector2.ZERO, Vector2.RIGHT * axis * power)
	$"Segment 1".apply_impulse(Vector2.ZERO, Vector2.UP * axis_y * power)
