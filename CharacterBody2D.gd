extends RigidBody2D

var speed = 500  
var target = null
var screaming = Vector2()
var isTouching = false
@onready var ding = $ding

	
func _input(event):
	isTouching = true
	if event.is_action_pressed("click"):
		target = get_global_mouse_position()
		isTouching = false

func _physics_process(delta):
	if target:
		screaming = position.direction_to(target) * speed
		if position.distance_to(target) < 20:
			isTouching = true
		#print(position.distance_to(target))
		if not isTouching:
			set_axis_velocity(screaming)
	
func _on_body_entered(body):
	$ding.play()
