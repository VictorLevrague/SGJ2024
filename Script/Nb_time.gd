extends Label

func _ready():
    self.text = str(1) + "h"

func _on_slidertime_value_changed(value):
    self.text = str(int(value)) + "h"
