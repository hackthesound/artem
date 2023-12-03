extends RigidBody2D

var mouseInside = false
var mousePressed = false
var shouldDrag = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print("epic") # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	#print(body)
	#print(self.get_position())
	#print(body.get_position())
	pass
	

func _input(event):
	if event.is_action_pressed("mouse"):
		print("prssed")
		mousePressed = true
		if(mouseInside):
			shouldDrag = true
			self.set_gravity_scale(0)
	elif event.is_action_released("mouse"):
		print("released")
		mousePressed = false
		shouldDrag = false
		self.set_gravity_scale(1)

func _physics_process(delta):
	var mouse_position = get_viewport().get_mouse_position()
	var movementDir = mouse_position - self.position
	if mousePressed and shouldDrag:
		print("movementdir",movementDir)
		#self.set_position(mouse_position)
		self.apply_force(movementDir*(mouse_position.distance_to(self.position)))

func _on_mouse_entered():
	mouseInside = true
	print("mouseinside")


func _on_mouse_exited():
	mouseInside = false
	print("mouseinside")


func _on_mouse_shape_entered(shape_idx):
	mouseInside = true
	print("mouseinside")


func _on_mouse_shape_exited(shape_idx):
	mouseInside = false
	print("mouseinside")


func _on_input_event(viewport, event, shape_idx):
	print("Any input event")
	if event is InputEventMouseButton:
		if event.is_pressed():
			print("Object clicked")
