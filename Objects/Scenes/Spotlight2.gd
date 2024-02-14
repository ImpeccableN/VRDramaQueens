extends Spatial

onready var lamp := $SpotLight

var temp_light_energy = 0.0

func lamp_switch():
	if lamp.light_energy > 0:
		temp_light_energy = lamp.light_energy
		lamp.light_energy = 0
	else:
		lamp.light_energy = temp_light_energy

func dim_light(angle):
	lamp.light_energy = ((angle + 45) / 90) * -1
