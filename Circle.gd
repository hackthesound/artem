extends RigidBody2D

var selected = false

signal dragsignal;

func _ready():
	if (selected):
		followMouse()
	
	
func _process(delta):
	if(selected):
		followMouse()
		print("WORKING")
		
		

		

func followMouse():
	position = get_global_mouse_position()


func _on_dragsignal():
	pass # Replace with function body.


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		print("midwork")
		if event.pressed:
			print("lololololol")
			#mouse down
			selected = true
	else:
		#Mouse released
		selected = false
		print("LOl")
