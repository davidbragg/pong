extends RigidBody2D

@export var speed = 800
# 0 right | 90 up | 180 left | 270 down
# clamp somewhere around 15 degrees off each?
# 15 - 75 | 105 - 165 | 195 - 255 | 285 - 345
var degrees = 45
var angle = deg_to_rad(degrees)
var x_direction = cos(angle)
var y_direction = -sin(angle)
var velocity

@onready var p1score = %Player1Score
@onready var p2score = %Player2Score

var score = [0, 0]

func _ready():
	# set FREEZE_MODE_KINEMATIC to remove gravity and forces
	# force moving by code
	freeze = true
	freeze_mode = RigidBody2D.FREEZE_MODE_KINEMATIC


func _process(delta):
	velocity = Vector2(x_direction, y_direction) * speed
	move_and_collide(velocity * delta)


# Handle Y direction collision
func _on_area_2d_body_entered(_body:Node2D):
	y_direction *= -1


func _on_bottom_boundary_body_entered(_body:Node2D):
	y_direction *= -1


#Handle X direction collision
func _on_right_boundary_body_entered(body:Node2D):
	x_direction *= -1
	score[0] += 1
	p1score.text = str(score[0])


func _on_left_boundary_body_entered(body:Node2D):
	x_direction *= -1
	score[1] += 1
	p2score.text = str(score[1])
