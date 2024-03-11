extends Spatial
#
#export var spawnpointObject : PackedScene
#
#onready var instancedLichtpult = preload("res://Objects/Interactables/Lichtpult.tscn")
#
#signal on_button_active
#
#var spawnpointOrigin : Vector3
#
#func _on_InteractableAreaButton_button_pressed(button):
#	spawnpointOrigin = spawnpointObject.transform.origin
#	var newLichtpult = instancedLichtpult.instance()
#	add_child(newLichtpult)
#	newLichtpult.transform.origin = spawnpointOrigin
