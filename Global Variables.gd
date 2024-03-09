extends Node

onready var progress := 0

signal tellProgress(progress)

func getProgress():
	return progress

func addProgress():
	progress += 1

