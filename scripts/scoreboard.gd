extends Node2D

var score = [0, 0]

func _ready():
	%Ball.connect("goal", Callable(self,"_on_goal"))

func _on_goal(collider):
	if collider == "BoundaryLeft":
		score[1] += 1
	else:
		score[0] += 1

	%Player1Score.text = str(score[0])
	%Player2Score.text = str(score[1])
