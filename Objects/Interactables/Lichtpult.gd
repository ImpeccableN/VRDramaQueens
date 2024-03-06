extends Spatial

export var connectedLight1 := NodePath()
export var connectedLight2 := NodePath()
export var connectedLightGroupLeft := NodePath()
export var connectedLightGroupRight := NodePath()
#export var onButton := NodePath()

onready var _connectedLight1 = get_node(connectedLight1)
onready var _connectedLight2 = get_node(connectedLight2)
onready var _connectedLightGroupLeft = get_node(connectedLightGroupLeft)
onready var _connectedLightGroupRight = get_node(connectedLightGroupRight)
#onready var _onButton = get_node(onButton)


func _ready():
#	var off_button = $OffButton/RedButton/InteractableAreaButton
	var button1 = $Button1/RedButton/InteractableAreaButton
	var button2 = $Button2/RedButton/InteractableAreaButton
	var button3 = $Button3/RedButton/InteractableAreaButton
	var button4 = $Button4/RedButton/InteractableAreaButton

	var lever1 = $Lever1/LeverOrigin/InteractableHinge
	var lever2 = $Lever2/LeverOrigin/InteractableHinge
	var lever3 = $Lever3/LeverOrigin/InteractableHinge
	var lever4 = $Lever4/LeverOrigin/InteractableHinge


#	off_button.connect("button_pressed", self, "_OffButton_pressed")
	button1.connect("button_pressed", self, "_OnButton1_pressed")
	button2.connect("button_pressed", self, "_OnButton2_pressed")
	button3.connect("button_pressed", self, "_OnButton3_pressed")
	button4.connect("button_pressed", self, "_OnButton4_pressed")
	lever1.connect("hinge_moved", self, "_OnHinge1_moved")
	lever2.connect("hinge_moved", self, "_OnHinge2_moved")
	lever3.connect("hinge_moved", self, "_OnHinge3_moved")
	lever4.connect("hinge_moved", self, "_OnHinge4_moved")


#
#func _OffButton_pressed(button):
#	visible = not visible
#	_onButton.visible = not _onButton.visible
#	print("true")
#
func _OnButton1_pressed(_button):
	_connectedLight1.lamp_switch()

func _OnButton2_pressed(_button):
	_connectedLight2.lamp_switch()

func _OnButton3_pressed(_button):
	_connectedLightGroupLeft.lamp_switch()

func _OnButton4_pressed(_button):
	_connectedLightGroupRight.lamp_switch()

func _OnHinge1_moved(angle):
	_connectedLight1.dim_light(angle)

func _OnHinge2_moved(angle):
	_connectedLight2.dim_light(angle)

func _OnHinge3_moved(angle):
	_connectedLightGroupLeft.dim_light(angle)

func _OnHinge4_moved(angle):
	_connectedLightGroupRight.dim_light(angle)


