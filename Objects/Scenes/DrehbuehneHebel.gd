extends Spatial

# Zugriff auf Nodes
onready var animation_player = get_node("/root/Main/MainAnimationPlayer")
onready var _progress = get_node("/root/Main/GlobalVariables")


# Winkelbegrenzungen für das Scharnier
const MAX_ANGLE = 45
const MIN_ANGLE = -45

#Speicher der vorherigen Hebelposition
var former_lever_position

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Dieser Pfad existiert: ")
	print(has_node("/root/Main/MainAnimationPlayer"))
	pass

# Handler für das hinge_moved-Signal des Scharniers
func _on_InteractableHinge_hinge_moved(angle):
	print(angle)
	var scene_progress = _progress.getProgress()
	# Prüfen, ob der Hebel ans andere Ende bewegt wurde
	if (angle == MIN_ANGLE and former_lever_position != MIN_ANGLE) or (angle == MAX_ANGLE and former_lever_position != MAX_ANGLE):
		print("true")
		# überprüfe den Global Progress und spiele die entsprechende Szene/Animation
		match scene_progress:
			0:
				animation_player.play("Szene1")
				_progress.addProgress()
			1:
				if animation_player.is_playing():
					animation_player.stop(false)
				animation_player.play("Drehbuehne1Auf2")
				_progress.addProgress()
				animation_player.animation_set_next("Drehbuehne1Auf2", "Szene2")
			2:
				if animation_player.is_playing():
					animation_player.stop(false)
				animation_player.play("Drehbuehne2Auf3")
				_progress.addProgress()
				animation_player.animation_set_next("Drehbuehne2Auf3", "Szene3")
