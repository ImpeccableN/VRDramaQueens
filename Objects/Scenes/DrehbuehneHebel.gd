extends Spatial

# Zugriff auf Nodes
onready var animation_player = get_node("/root/Main/MainAnimationPlayer")
onready var _progress = get_node("/root/Main/GlobalVariables")


# Winkelbegrenzungen für das Scharnier
const MAX_ANGLE = 40
const MIN_ANGLE = -40

#Speicher der vorherigen Hebelposition. "True" ist vorne, "False" ist hinten.
var former_lever_position = true
var scene_paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Handler für das hinge_moved-Signal des Scharniers
func _on_InteractableHinge_hinge_moved(angle):
	print(angle)
	var scene_progress = _progress.getProgress()
	# Prüfen, ob der Hebel ans andere Ende bewegt wurde
	if (angle <= MIN_ANGLE and former_lever_position != true) or (angle >= MAX_ANGLE and former_lever_position != false):
		
		# überprüfe den Global Progress und spiele die entsprechende Szene/Animation
		match scene_progress:
			1:
				if animation_player.is_playing():
					animation_player.stop(false)
				animation_player.animation_set_next("Drehbuehne1Auf2", "Szene2")
				animation_player.play("Drehbuehne1Auf2")
				_progress.addProgress()
				
			2:
				if animation_player.is_playing():
					animation_player.stop(false)
				animation_player.animation_set_next("Drehbuehne2Auf3", "Szene3_Rest")
				animation_player.play("Drehbuehne2Auf3")
				_progress.addProgress()
				
			3:
				if animation_player.is_playing():
					animation_player.stop(false)
				animation_player.animation_set_next("Drehbuehne3Auf4", "Szene4")
				animation_player.play("Drehbuehne3Auf4")
				_progress.addProgress()
		
		
		
		former_lever_position = not former_lever_position


func _on_AnimationPlayerVorhangRechts_animation_finished(anim_name):
	if _progress.getProgress() == 0:
		animation_player.play("Szene1")
		_progress.addProgress()
	elif animation_player.is_playing() and scene_paused == false:
		animation_player.stop(false)
		scene_paused = true
	elif not animation_player.is_playing() and scene_paused == true:
		animation_player.play()
		scene_paused = false
