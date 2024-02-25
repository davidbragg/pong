extends Node2D

var score = [0, 0]
@onready var p1text = %Player1Score
@onready var p2text = %Player2Score
@onready var ball = %Ball

func _ready():
	ball.connect("p1goal", Callable(self,"_on_p1goal"))
	ball.connect("p2goal", Callable(self,"_on_p2goal"))

func _process(_delta):
	pass

func _on_p1goal():
	score[0] += 1
	p1text.text = str(score[0])

func _on_p2goal():
	score[1] += 1
	p2text.text = str(score[1])
