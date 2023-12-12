extends Spatial

onready var animation_player_left = $AnimationPlayerVorhangLinks
onready var animation_player_right = $AnimationPlayerVorhangRechts



func _on_XRToolsInteractableAreaButton_button_pressed(button):
	animation_player_left.play("Vorhang_links")
	animation_player_right.play("Vorhang_rechts")
