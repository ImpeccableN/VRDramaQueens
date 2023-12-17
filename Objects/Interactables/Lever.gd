extends Node2D

# Drehbühne, die gesteuert werden soll
var turntable : Spatial

# Called when the lever is activated
func activate_lever():
	# Hier können Sie die Aktionen ausführen, die beim Betätigen des Hebels passieren sollen
	# In diesem Beispiel drehen Sie die Drehbühne um 90 Grad
	turntable.rotation_degrees.y += 90
	# Fügen Sie hier weitere Aktionen hinzu, die beim Betätigen des Hebels passieren sollen

# Toggle-Methode, die aufgerufen wird, wenn der Hebel betätigt wird
func toggle_lever():
	activate_lever()
	emit_signal("lever_activated")
