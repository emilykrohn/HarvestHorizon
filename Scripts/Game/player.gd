extends CharacterBody2D


const SPEED = 75.0
var direction := "Forward"
var is_tilling := false
var current_tile
var current_player_tile

@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	var horizontal_direction = Input.get_axis("ui_left", "ui_right")
	var vertical_direction = Input.get_axis("ui_up", "ui_down")
	
	direction = $%PlayerMovement.get_direction(horizontal_direction, vertical_direction)
	
	if is_tilling:
		if abs(current_player_tile.x - current_tile.x) <= 1 and abs(current_player_tile.y - current_tile.y) <= 1:
			animated_sprite_2d.play(direction + "Till")
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.y = move_toward(velocity.y, 0, SPEED)
	else:
		velocity = $%PlayerMovement.movement(horizontal_direction, vertical_direction, velocity, SPEED)

	move_and_slide()

func play_till_animation(animation, tile, player_tile):
	is_tilling = true
	current_tile = tile
	current_player_tile = player_tile

func stop_till_animation():
	is_tilling = false
