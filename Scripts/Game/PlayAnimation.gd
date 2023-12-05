extends Node

func play(direction, action):
	get_parent().animated_sprite_2d.play(direction + action)
