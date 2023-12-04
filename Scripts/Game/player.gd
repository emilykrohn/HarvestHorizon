extends CharacterBody2D


const SPEED = 75.0

@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	var horizontal_direction = Input.get_axis("ui_left", "ui_right")
	var vertical_direction = Input.get_axis("ui_up", "ui_down")
	if horizontal_direction or vertical_direction:
		velocity = Vector2(horizontal_direction, vertical_direction).normalized() * SPEED
		animated_sprite_2d.play("ForwardWalk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		animated_sprite_2d.play("ForwardIdle")

	move_and_slide()
