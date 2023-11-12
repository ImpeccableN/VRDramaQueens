extends SpotLight

onready var tempLightEnergy = 0.0

func _on_InteractableLever_hinge_moved(angle, hinge_limit_min, hinge_limit_max):
	angle = -angle
	light_energy = ((angle + hinge_limit_max) / hinge_limit_max * 2)


func _on_Frame_pointer_pressed(at):
	if visible == true:
		visible = false
	else:
		visible = true
