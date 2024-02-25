extends CharacterBody2D

var speed_max = EnvVars.paddle_speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_UP) and abs(velocity.y) < speed_max:
		velocity.y = lerp(velocity.y, -speed_max, 0.75)
	elif Input.is_key_pressed(KEY_DOWN) and velocity.y < speed_max:
		velocity.y += lerp(velocity.y, speed_max, 0.75)
	elif !Input.is_key_pressed(KEY_UP) and !Input.is_key_pressed(KEY_DOWN):
		velocity.y = lerp(velocity.y, 0.0, 0.3)

	move_and_collide(velocity * delta)
