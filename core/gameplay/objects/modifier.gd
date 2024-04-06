extends Panel

var lamp = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$lamp.text = "lamp" + str(lamp)
	pass # Replace with function body.


func _on_lampslider_drag_started():
	if $lampslider.drag_started:
		lamp = lamp + 10
		$lamp.text = "lamp" + str(lamp)
	pass # Replace with function body.


 
