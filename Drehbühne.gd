extends StaticBody



func _on_InteractableHinge_hinge_moved(angle, hinge_limit_min, hinge_limit_max):
	angle = -angle
	rotation_degrees.y = ((angle + hinge_limit_max) / hinge_limit_max) * 180
