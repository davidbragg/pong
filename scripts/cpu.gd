extends CharacterBody2D

var speed_max = EnvVars.paddle_speed

# naive CPU implementation that simply follows the ball y position
# and attempts to move towards it
func _process(delta):
	if global_position.y < %Ball.global_position.y:
		velocity.y = lerp(velocity.y, speed_max, 0.75)
	elif global_position.y > %Ball.global_position.y:
		velocity.y = lerp(velocity.y, -speed_max, 0.75)
	else:
		velocity.y = lerp(velocity.y, 0.0, 0.3)

	move_and_collide(velocity * delta)
