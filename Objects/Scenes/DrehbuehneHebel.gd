extends Spatial

# Zugriff auf Nodes
onready var animation_player = get_node("/root/Main/MainAnimationPlayer")
onready var _progress = get_node("/root/Main/GlobalVariables")
onready var briefPreload = preload("res://Objects/Scenes/BriefPickable.tscn")
onready var briefspawn = get_node("/root/Main/BriefSpawn")
onready var brief_detector = get_node("/root/Main/MainAnimationPlayer/Torvald_animated/BriefDetectorArea")
onready var blinking_light = get_node("/root/Main/dressingRoom/BlinkingSpot/Timer")

# Winkelbegrenzungen für das Scharnier
const MAX_ANGLE = 40
const MIN_ANGLE = -40

#Speicher der vorherigen Hebelposition. "True" ist vorne, "False" ist hinten.
var former_lever_position = true
var scene_paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("RESET")

# Handler für das hinge_moved-Signal des Scharniers
func _on_InteractableHinge_hinge_moved(angle):
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
				#setz Progress auf 2
				_progress.addProgress()
			2:
				if animation_player.is_playing():
					animation_player.stop(false)
				animation_player.animation_set_next("Drehbuehne2Auf3", "Szene3_Rest")
				animation_player.play("Drehbuehne2Auf3")
				#setz Progress auf 3
				_progress.addProgress()
			3:
				if animation_player.is_playing():
					animation_player.stop(false)
				animation_player.animation_set_next("Drehbuehne3Auf4", "Szene4")
				animation_player.play("Drehbuehne3Auf4")
				#setz Progress auf 4
				_progress.addProgress()
				var briefInstance = briefPreload.instance()
				add_child(briefInstance)
				briefInstance.global_transform.origin = briefspawn.global_transform.origin
#				brief_detector.monitoring = true
			4:
				if animation_player.is_playing():
					animation_player.stop(false)
				animation_player.animation_set_next("Drehbuehne4Auf5", "Szene5")
				animation_player.play("Drehbuehne4Auf5")
				#setz Progress auf 5
				_progress.addProgress()
				blinking_light.start()
		
		
		
		former_lever_position = not former_lever_position


func _on_AnimationPlayerVorhangRechts_animation_finished(_anim_name):
	if _progress.getProgress() == 0:
		animation_player.play("Szene1")
		#setz Progress auf 1
		_progress.addProgress()
	elif animation_player.is_playing() and scene_paused == false:
		animation_player.stop(false)
		scene_paused = true
	elif not animation_player.is_playing() and scene_paused == true:
		animation_player.play()
		scene_paused = false

#wenn der Brief in den Mülleimer geworfen wird
func _on_Eimer_body_entered(body):
	body.queue_free()
	#setz Progress auf 8
	_progress.addProgress()
	var eimer_area = get_node("/root/Main/dressingRoom/Eimer")
	eimer_area.monitoring = false

#wenn der Brief an Torvald gegeben wird
func _on_BriefDetectorArea_body_entered(body):
	body.queue_free()
	if animation_player.is_playing():
		animation_player.stop(false)
	animation_player.play("Szene7_2")

#triggert die letzte szene, wenn der brief weggeschmissen wurde
func _on_LastSceneTriggerArea_body_entered(_body):
	if _progress.getProgress() == 5:
		if animation_player.is_playing():
			animation_player.stop(false)
		animation_player.play("KrogstadUndLinde")
		blinking_light.stop()
		#setz Progress auf 6
		_progress.addProgress()
	if _progress.getProgress() == 6:
		if animation_player.is_playing():
			animation_player.stop(false)
		animation_player.play("Szene6")
		blinking_light.start()
		#setz Progress auf 7
		_progress.addProgress()
		#spawn letter
		var briefInstance = briefPreload.instance()
		add_child(briefInstance)
		briefInstance.global_transform.origin = briefspawn.global_transform.origin
	if _progress.getProgress() == 7:
		blinking_light.stop()
	if _progress.getProgress() == 8:
		if animation_player.is_playing():
			animation_player.stop(false)
		animation_player.play("Szene7_1")
	
