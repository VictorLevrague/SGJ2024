extends Label

func _ready():
    self.text = str(0) + " % DILUTION"

func _on_sliderdilution_value_changed(value):
    self.text = str(value) + " % DILUTION"
