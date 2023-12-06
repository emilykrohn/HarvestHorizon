extends Node

var current_tile
var current_player_tile
var is_tilling
var can_till := true

func start_tilling(tile, player_tile):
	is_tilling = true
	current_tile = tile
	current_player_tile = player_tile

func stop_tilling():
	is_tilling = false

func get_current_tile():
	return current_tile

func get_current_player_tile():
	return current_player_tile

func get_is_tilling():
	return is_tilling

func _on_tilling_cooldown_timeout():
	can_till = true
	print("Can Till")

func set_can_till(flag):
	can_till = flag

func get_can_till():
	return can_till
