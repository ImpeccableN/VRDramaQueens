extends Spatial

onready var animation_player_left = $AnimationPlayerVorhangLinks
onready var animation_player_right = $AnimationPlayerVorhangRechts

var vorhang_offen = true


func _on_XRToolsInteractableAreaButton_button_pressed(_button):
	if vorhang_offen: 
		animation_player_left.play("Vorhang_links")
		animation_player_right.play("Vorhang_rechts")
		vorhang_offen = not vorhang_offen
	else:
		animation_player_left.play_backwards("Vorhang_links")
		animation_player_right.play_backwards("Vorhang_rechts")
		vorhang_offen = not vorhang_offen
