extends Node

var can_select := false
var has_previous_tile := false
var has_exited_tile := false
var previous_tile

func _on_upper_dirt_patch_mouse_entered():
	can_select = true

func _on_upper_dirt_patch_mouse_exited():
	erase_select_tile()

func _on_lower_dirt_patch_mouse_entered():
	can_select = true

func _on_lower_dirt_patch_mouse_exited():
	erase_select_tile()

func erase_select_tile():
	has_exited_tile = true
	can_select = false
	has_previous_tile = false
	if has_previous_tile:
		$%TileMap.erase_cell(4, $%TileMap.previous_tile)

func in_range(tile, player_tile, range):
	if abs(tile.x - player_tile.x) <= range:
		if abs(tile.y - player_tile.y) <= range:
			return true
	return false

func set_previous_tile(tile):
	previous_tile = tile

func get_previous_tile():
	return previous_tile
