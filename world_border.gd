extends StaticBody2D


# Called when the node enters the scene tree for the first time.
	
func _ready():
	get_tree().get_root().size_changed.connect(_on_viewport_resize)
	_on_viewport_resize()
	self.owner.unfreezeBall()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_viewport_resize():
	var newSize = get_viewport().get_visible_rect().size
	self.set_position(Vector2(newSize.x/2,newSize.y/2))
	for child in self.get_children():
		if child is CollisionShape2D and child.shape is WorldBoundaryShape2D:
			child.shape.set_distance(0.5 * ((child.shape.normal.x*newSize.x)+(child.shape.normal.y*newSize.y)))
			child.disabled = false
			#print(child.shape.normal,child.shape.distance)
