extends TileMap

var can_select := false
var previous_tile = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_select:
		var tile = local_to_map(get_global_mouse_position())
		if previous_tile: 
			erase_cell(4, previous_tile)
		set_cell(4, tile, 10, Vector2i(0,0), 0)
		previous_tile = tile

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
