extends CharacterBody2D

@export var speed = 2
var collision_data

signal p1goal
signal p2goal

func _ready():
	velocity = Vector2(randf_range(100, 300), randf_range(100, 300))

func _process(delta):
	collision_data = move_and_collide(velocity * delta * speed)

	if collision_data:
		var collider_name = collision_data.get_collider().name
		match collider_name:
			"Player", "CPU":
				velocity.y += randf_range(-100, 100)
			"BoundaryLeft":
				emit_signal("p2goal")
			"BoundaryRight":
				emit_signal("p1goal")

		velocity = velocity.bounce(collision_data.get_normal())

