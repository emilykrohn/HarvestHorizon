extends TileMap

var can_select := false
var previous_tile = false
var tilled_tiles = []

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_select:
		var tile = local_to_map(get_global_mouse_position())
		var player_tile = local_to_map($%Player.global_position)
		# erase previous select sprite
		if previous_tile: 
			erase_cell(4, previous_tile)
		# create select sprite where mouse is
		if in_range(tile, player_tile, 1):
			set_cell(4, tile, 10, Vector2i(0,0), 0)
		previous_tile = tile
		if Input.is_action_just_pressed("left_click") and in_range(tile, player_tile, 1):
			$%Player/Tilling.start_tilling(tile, player_tile)
			set_cell(5, tile, 11, Vector2i(5,1), 0)
			tilled_tiles.append(tile)
		elif Input.is_action_just_released("left_click"):
			$%Player/Tilling.stop_tilling()
		elif Input.is_action_pressed("right_click") and in_range(tile, player_tile, 1):
			set_cell(5, tile, 13, Vector2i(0,1), 0)

func _on_upper_dirt_patch_mouse_entered():
	can_select = true

func _on_lower_dirt_patch_mouse_entered():
	can_select = true

func _on_upper_dirt_patch_mouse_exited():
	can_select = false
	erase_cell(4, previous_tile)
	previous_tile = false

func _on_lower_dirt_patch_mouse_exited():
	can_select = false
	erase_cell(4, previous_tile)
	previous_tile = false

func in_range(tile, player_tile, range):
	return abs(tile - player_tile) <= Vector2i(range, range)

