extends Label

func _on_sliderdilution_value_changed(value):
    self.text = str(value) + " % DILUTION"
