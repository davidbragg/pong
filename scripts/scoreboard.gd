extends Node2D

var score = [0, 0]
@onready var p1text = %Player1Score
@onready var p2text = %Player2Score
@onready var ball = %Ball

func _ready():
	ball.connect("goal", Callable(self,"_on_goal"))

func _on_goal(collider):
	print("collider: ", collider)
	if collider == "BoundaryLeft":
		score[1] += 1
	else:
		score[0] += 1

	p1text.text = str(score[0])
	p2text.text = str(score[1])

