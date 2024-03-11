extends Node

onready var progress := 0

signal tellProgress(progress)

func getProgress():
	return progress

func addProgress():
	progress += 1

func setProgress(numb):
	progress = numb


func _on_MainAnimationPlayer_animation_finished(anim_name):
	if anim_name == "Szene7_1":
		get_tree().change_scene("res://EndScene_Video.tscn")
