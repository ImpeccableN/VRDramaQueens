extends Spatial

onready var lamparray := get_children()

var temp_light_energy = 0.0

func lamp_switch():
	for lamp in lamparray:
			if lamp.light_energy > 0:
				temp_light_energy = lamp.light_energy
				lamp.light_energy = 0
			else:
				lamp.light_energy = temp_light_energy

func dim_light(angle):
	for lamp in lamparray:
		lamp.light_energy = ((angle + 45) / 90) * -1
