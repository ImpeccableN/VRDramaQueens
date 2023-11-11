extends DirectionalLight



func _on_InteractableLever_hinge_moved(angle, min_energy, max_energy):
	light_energy = (angle + max_energy)  / max_energy * 2
