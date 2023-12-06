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
	
	if $%Tilling.get_is_tilling():
		if abs($%Tilling.get_current_player_tile() - $%Tilling.get_current_tile()) <= Vector2i(1,1):
			$%PlayAnimation.play(direction, "Till")
			velocity = Vector2.ZERO
	else:
		velocity = $%PlayerMovement.movement(horizontal_direction, vertical_direction, velocity, SPEED)
		if velocity:
			direction = $%PlayerMovement.get_direction(horizontal_direction, vertical_direction)
			$%PlayAnimation.play(direction, "Walk")
		else:
			$%PlayAnimation.play(direction, "Idle")

	move_and_slide()
