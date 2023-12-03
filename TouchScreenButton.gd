extends TouchScreenButton


var screaming = Vector2()
var isTouching = false
var yPos
var xPos
var newY
var newX

func on_TouchScreenButton_pressed():
	isTouching = true
	print("yikes")

func on_TouchScreenButton_released():
	isTouching = false
	print("kill me please")

func input(event):
	print("event")
	if isTouching:
		if event is InputEventScreenTouch and event.isPressed():
			screaming = event.get_position()
			yPos = screaming.y - position.y
			xPos = screaming.x - position.x
		elif event is InputEventScreenDrag:
			screaming = event.get_position()
			newY = screaming.y - position.y
			newX = screaming.x - position.x
			set_position(Vector2(newX, newY))
