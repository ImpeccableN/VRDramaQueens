extends Spatial

func _ready():
	# Verbinden Sie das Signal mit einer Funktion, die aufgerufen wird, wenn der Hebel betätigt wird
	$Lever.connect("lever_activated", self, "_on_lever_activated")

func _on_lever_activated():
	# Hier können Sie Aktionen ausführen, die bei Betätigung des Hebels an der Drehbühne passieren sollen
	print("Hebel wurde betätigt!")
	# Fügen Sie hier weitere Aktionen hinzu, die bei Betätigen des Hebels an der Drehbühne passieren sollen
