extends Panel


var algues = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	update_text()

func update_text():
	$algueslabel.text = "Algues : %s" %algues


func create_algues():
	algues =+ 1
	update_text()
	
	
func _on_alguesbouton_pressed():
	create_algues()
