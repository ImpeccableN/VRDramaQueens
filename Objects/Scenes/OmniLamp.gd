extends Spatial

onready var lamp := $OmniLight

var temp_light_energy = 0
var lamp_on = true

func lamp_switch():
	if lamp.light_energy > 0:
		temp_light_energy = lamp.light_energy
		lamp.light_energy = 0
		lamp_on = false
	else:
		lamp.light_energy = temp_light_energy
		lamp_on = true

func dim_light(angle):
	if lamp_on:
		lamp.light_energy = ((angle + 45) / 90)  * 16
