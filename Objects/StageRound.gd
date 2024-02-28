extends Spatial

# Zugriff auf den AnimationPlayer
onready var animation_player = $AnimationPlayerDrehbuehne

# Winkelbegrenzungen für das Scharnier
const MAX_ANGLE = 45
const MIN_ANGLE = -45

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Handler für das hinge_moved-Signal des Scharniers
func _on_InteractableHinge_hinge_moved(angle):
# Prüfen, ob der Winkel innerhalb der Grenzen liegt
	if angle == MIN_ANGLE or angle == MAX_ANGLE:
		# Wenn ja, führe die Animation aus
		animation_player.play("drehen")
	else:
		# Andernfalls stoppe die Animation oder führe andere Aktionen aus
		animation_player.stop()  # Hier kannst du die Animation anhalten oder andere Aktionen ausführen