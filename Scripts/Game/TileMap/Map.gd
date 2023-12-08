extends TileMap

var tilled_tiles = []

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $%TileSelect.can_select:
		var tile = local_to_map(get_global_mouse_position()) # current tile mouse is over
		var player_tile = local_to_map($%Player.global_position) # current tile player is standing on
		if $%TileSelect.has_previous_tile:
			erase_cell(4, $%TileSelect.get_previous_tile()) # erase previous select sprite
			
		if $%TileSelect.in_range(tile, player_tile, 1): # Check if player and mouse are in range of each other
			set_cell(4, tile, 10, Vector2i(0,0), 0) # create select sprite where mouse is

		$%TileSelect.set_previous_tile(tile) # store current tile as previous tile to be used next iteration
		$%TileSelect.has_previous_tile = true
		
		# Till with left click
		if Input.is_action_just_pressed("left_click") and $%TileSelect.in_range(tile, player_tile, 1):
			$%Player/Tilling.start_tilling(tile, player_tile)
			$%Planting.place_tilled_tile(tile)
			$%Player/Tilling.add_to_tilled_list(tile)
		elif Input.is_action_just_released("left_click"):
			$%Player/Tilling.stop_tilling()
		
		# Plant seed when right click
		elif Input.is_action_pressed("right_click") and $%TileSelect.in_range(tile, player_tile, 1) and tile in $%Player/Tilling.tilled_tiles:
			$%Player/Tilling.remove_from_tilled_list(tile)
			$%Planting.add_to_planted_list(tile)
			$%Planting.place_plant_tile(tile)

	if $%TileSelect.has_exited_tile:
		erase_cell(4, $%TileSelect.get_previous_tile()) # erase previous select sprite
		$%TileSelect.has_exited_tile = false



