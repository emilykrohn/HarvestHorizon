extends Node

var planted_tiles = []

func place_plant_tile(tile):
	$%TileMap.set_cell(5, tile, 13, Vector2i(0,1), 0)

func add_to_planted_tiles_list(tile):
	planted_tiles.append(tile)

func get_planted_tiles():
	return planted_tiles
