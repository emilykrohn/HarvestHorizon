extends Node

var current_tile
var current_player_tile
var is_tilling
var play_animation := false

var tilled_tiles = []

func start_tilling(tile, player_tile):
	play_animation = true
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

func get_play_animation():
	return play_animation

func set_play_animation(flag):
	play_animation = flag

func _on_animated_sprite_2d_animation_looped():
	play_animation = false
	stop_tilling()

func add_to_tilled_list(tile):
	tilled_tiles.append(tile)

func remove_from_tilled_list(tile):
	tilled_tiles.erase(tile)
