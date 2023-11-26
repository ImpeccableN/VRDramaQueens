class_name XRToolsInteractableBody
extends PhysicsBody


signal pointer_pressed(at)
signal pointer_released(at)
signal pointer_moved(from, to)
signal pointer_entered()
signal pointer_exited()



func _on_NoraStandIn_pointer_pressed(at):
	$Barbarian/AnimationPlayer.play("2H_Melee_Attack_Spin")


func _on_TestSpotlight2_spotlight_on():
	$Barbarian/AnimationPlayer.play("1H_Melee_Attack_Chop")
