extends Label

func _ready():
    self.text = str(100/24) + "h"

func _on_slidertime_value_changed(value):
    self.text = str(int(value * 24/100)) + "h"
