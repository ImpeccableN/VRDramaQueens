extends Spatial


export var figure = "figure name"
export var dialog_index = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("figure")


func start_dialog():
	var dialog = Dialogic.start (figure + str(dialog_index))
	dialog.pause_mode = PAUSE_MODE_PROCESS
	get_parent().add_child(dialog)
	dialog.connect("timeline_end", self, "end_dialog")
	get_tree().paused = true
	
func end_dialog(data):
		get_tree().paused = false
