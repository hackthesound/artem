extends Button
@export var sceneToLoad : String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	var button = self
	button.pressed.connect(self._button_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _button_pressed():
	print("Loading:",sceneToLoad)
	var next_scene = load(sceneToLoad)
	get_tree().change_scene_to_packed(next_scene)
