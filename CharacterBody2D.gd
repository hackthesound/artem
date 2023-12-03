extends CharacterBody2D
var speed = 350  # speed in pixels/sec
var isNotFish: bool = true

func _physics_process(delta):
	if (self.get_position().x < self.find_parent("Node2D").find_child("Line2D").get_position().x + 25 || isNotFish):
		var direction = Input.get_vector("A", "D", "W", "S")
		velocity = direction * speed
		move_and_slide()
	if (Input.is_action_just_pressed("F") && self.get_position().x >= self.find_parent("Node2D").find_child("Line2D").get_position().x + 25):
		isNotFish = not isNotFish
