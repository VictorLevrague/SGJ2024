extends Label

func _ready():
    self.text = str(0) + "%"

func _on_sliderdilution_value_changed(value):
    self.text = str(value) + "%"
