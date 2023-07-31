extends TextureRect
@export var button: Button
@export var optionButton: OptionButton
@export var seedInput: TextEdit
@export var planetIndex: TextEdit

func _ready():
	button.pressed.connect(_on_generate_pressed)
	Globals.feltyrion.prepare_star()
	_on_generate_pressed()
	
func _on_generate_pressed():
	if (seedInput.text == ""):
		randomize()
		generate(int(planetIndex.text), optionButton.selected, randf() * 1000)
	else:
		generate(int(planetIndex.text), optionButton.selected, float(seedInput.text))

func generate(planet_index, type, seed):
	Globals.feltyrion.lock()
	Globals.feltyrion.load_planet(planet_index, type, seed, true, false)
	var img = Globals.feltyrion.return_image(true, false)
	#img = feltyrion.return_atmosphere_image()
	var imageTexture = ImageTexture.create_from_image(img)
	self.texture = imageTexture
	self.queue_redraw()
	Globals.feltyrion.unlock()
