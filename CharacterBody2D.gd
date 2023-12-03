extends CharacterBody2D

var speed = 400 
var target = null

func _input(event):
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()

func _physics_process(delta):
	if target:
		velocity = position.direction_to(target) * speed
		if position.distance_to(target) < 10:
			velocity = Vector2.ZERO
	move_and_slide()


