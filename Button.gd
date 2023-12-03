extends Button
var unknown = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#if self.toggled:
		#print("not working")
		#$DoeToJoy.play()


func _on_button_down():
	if unknown == false:
		unknown = true
	elif unknown == true:
		unknown = false
	
	if self.toggled and unknown:
		$DoeToJoy.play()
	else:
		$DoeToJoy.stop()
