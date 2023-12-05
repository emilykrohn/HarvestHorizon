extends CharacterBody2D


const SPEED = 75.0
var direction := "Forward"
var is_tilling := false

@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	var horizontal_direction = Input.get_axis("ui_left", "ui_right")
	var vertical_direction = Input.get_axis("ui_up", "ui_down")
	if is_tilling:
		animated_sprite_2d.play(direction + "Till")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	else:
		if horizontal_direction or vertical_direction:
			velocity = Vector2(horizontal_direction, vertical_direction).normalized() * SPEED
			if horizontal_direction < 0:
				animated_sprite_2d.play("LeftWalk")
				direction = "Left"
			elif horizontal_direction > 0:
				animated_sprite_2d.play("RightWalk")
				direction = "Right"
			elif vertical_direction < 0:
				animated_sprite_2d.play("UpWalk")
				direction = "Up"
			else:
				animated_sprite_2d.play("ForwardWalk")
				direction = "Forward"
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.y = move_toward(velocity.y, 0, SPEED)
			animated_sprite_2d.play(direction + "Idle")

	move_and_slide()

func play_till_animation(animation):
	is_tilling = true

func stop_till_animation():
	is_tilling = false
