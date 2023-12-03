extends CharacterBody2D
var speed = 350  # speed in pixels/sec
var isNotFish: bool = true

func _ready():
	$frontSprite.show() 
	$backSprite.hide()
	$leftSprite.hide()
	$rightSprite.hide()
	$fishingRod.hide()
	self.find_parent("Node2D").find_child("fishCurser").find_child("fishCurserSprite").hide()

func _physics_process(delta):
	if (isNotFish):
		$fishingRod.hide()
		self.find_parent("Node2D").find_child("fishCurser").find_child("fishCurserSprite").hide()
	if (self.get_position().x < self.find_parent("Node2D").find_child("Line2D").get_position().x + 25 || isNotFish):
		var direction = Input.get_vector("A", "D", "W", "S")
		velocity = direction * speed
		if (direction.x < 0):
			$frontSprite.hide() 
			$backSprite.hide()
			$leftSprite.show()
			$rightSprite.hide()
		if (direction.x > 0):
			$frontSprite.hide() 
			$backSprite.hide()
			$leftSprite.hide()
			$rightSprite.show()
		if (direction.y > 0 && direction.x == 0):
			$frontSprite.show() 
			$backSprite.hide()
			$leftSprite.hide()
			$rightSprite.hide()
		if (direction.y < 0 && direction.x == 0):
			$frontSprite.hide() 
			$backSprite.show()
			$leftSprite.hide()
			$rightSprite.hide()
		move_and_slide()
	if (Input.is_action_just_pressed("F") && self.get_position().x >= self.find_parent("Node2D").find_child("Line2D").get_position().x + 25):
		isNotFish = not isNotFish
		self.find_parent("Node2D").find_child("fishCurser").find_child("fishCurserSprite").show()
		$frontSprite.hide() 
		$backSprite.hide()
		$leftSprite.hide()
		$rightSprite.show()
		$fishingRod.show()
	
