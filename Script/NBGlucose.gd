extends Label

func _ready():
    self.text = str(0) + " % GLUCOSE"

func _on_sliderglucose_value_changed(value):
    self.text = str(value) + " % GLUCOSE"
