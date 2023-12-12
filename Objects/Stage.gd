extends Spatial

onready var animation_player = $AnimationPlayer



func _on_XRToolsInteractableAreaButton_button_pressed(button):
	animation_player.play("Vorhang_links")
	animation_player.play("Vorhang_rechts")
