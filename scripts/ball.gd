extends CharacterBody2D

@export var speed = 2
@export var start_position = Vector2(246, 389)

var active = false
var collision_data

signal goal

func _ready():
	position = start_position

func _process(delta):
	if !active and Input.is_key_pressed(KEY_SPACE):
		active = true
		velocity = Vector2(randf_range(100, 300), randf_range(100, 300))

	if active:
		collision_data = move_and_collide(velocity * delta * speed)

		if collision_data:
			var collider_name = collision_data.get_collider().name
			match collider_name:
				"Player", "CPU":
					velocity.y += randf_range(-100, 100)
				"BoundaryLeft", "BoundaryRight":
					emit_signal("goal", collider_name)
					active = false
					velocity = Vector2.ZERO
					position = start_position

			velocity = velocity.bounce(collision_data.get_normal())