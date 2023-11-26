extends Spatial

export var connectedLight1 := NodePath()
export var connectedLight2 := NodePath()
export var connectedLight3 := NodePath()
export var onButton := NodePath()

onready var _connectedLight1 = get_node(connectedLight1)
onready var _connectedLight2 = get_node(connectedLight2)
onready var _connectedLight3 = get_node(connectedLight3)
onready var _onButton = get_node(onButton)


func _ready():
	var off_button = $OffButton/RedButton/InteractableAreaButton
	var button1 = $Button1/RedButton/InteractableAreaButton
	var button2 = $Button2/RedButton/InteractableAreaButton
	var button3 = $Button3/RedButton/InteractableAreaButton
	
	
	off_button.connect("button_pressed", self, "_OffButton_pressed")
	button1.connect("button_pressed", self, "_OnButton1_pressed")
	button2.connect("button_pressed", self, "_OnButton2_pressed")
	button3.connect("button_pressed", self, "_OnButton3_pressed")


func _OffButton_pressed(button):
	visible = not visible
	_onButton.visible = not _onButton.visible
	print("true")

func _OnButton1_pressed(_button):
	_connectedLight1.visible = not _connectedLight1.visible

func _OnButton2_pressed(_button):
	_connectedLight2.visible = not _connectedLight2.visible

func _OnButton3_pressed(_button):
	_connectedLight3.visible = not _connectedLight3.visible
