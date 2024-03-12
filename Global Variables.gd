extends Node

onready var progress := 0


func getProgress():
	return progress

func addProgress():
	progress += 1

func setProgress(numb):
	progress = numb

func _on_MainAnimationPlayer_animation_finished(anim_name):
	if anim_name == "Szene7_2":
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Objects/Scenes/Ende.tscn")
	elif anim_name == "Szene7_1":
		get_tree().change_scene("res://7_2VideoScene.tscn")
