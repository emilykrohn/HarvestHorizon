extends Node

func movement(horizontal_direction, vertical_direction, velocity, SPEED):
	if horizontal_direction or vertical_direction:
		return Vector2(horizontal_direction, vertical_direction).normalized() * SPEED
	else:
		return Vector2.ZERO

func get_direction(horizontal_direction, vertical_direction):
	if horizontal_direction < 0:
		return "Left"
	elif horizontal_direction > 0:
		return "Right"
	elif vertical_direction < 0:
		return "Up"
	else:
		return "Forward"
