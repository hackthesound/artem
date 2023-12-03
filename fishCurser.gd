extends CharacterBody2D

var speed = 400  # speed in pixels/sec

func _physics_process(delta):
	if (not self.find_parent("Node2D").find_child("Character").find_child("CharacterBody2D").isNotFish):
		var direction = Input.get_vector("Left", "Right", "Up", "Down")
		velocity = direction * speed
		move_and_slide()
		

