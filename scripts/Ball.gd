extends RigidBody2D

var speed = 400
var angle = deg_to_rad(45)
var x_direction = cos(angle)
var y_direction = -sin(angle)
var velocity



func _ready():
	# set FREEZE_MODE_KINEMATIC to remove gravity and forces
	# force moving by code
	freeze = true
	freeze_mode = RigidBody2D.FREEZE_MODE_KINEMATIC



func _process(delta):
	velocity = Vector2(x_direction, y_direction) * speed
	move_and_collide(velocity * delta)
	print(position.x, " ", position.y)

	if position.y < 60 or position.y > 588:
		y_direction *= -1

	if position.x < 60 or position.x > 1092:
		x_direction *= -1

