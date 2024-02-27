extends Spatial

onready var lamparray := get_children()

var temp_light_energy = 0.0

func lamp_switch():
	for lamp in lamparray:
			lamp.lamp_switch()

func dim_light(angle):
	for lamp in lamparray:
		lamp.dim_light(angle)
