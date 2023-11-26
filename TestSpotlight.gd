extends SpotLight

signal spotlight_on

onready var tempLightEnergy = 0.0

func _process(_delta):
	if visible == true:
		emit_signal("spotlight_on")

func _on_InteractableLever_hinge_moved(angle, _hinge_limit_min, hinge_limit_max):
	angle = -angle
	light_energy = ((angle + hinge_limit_max) / hinge_limit_max * 2)


func _on_Frame_pointer_pressed(_at):
	visible = not visible

