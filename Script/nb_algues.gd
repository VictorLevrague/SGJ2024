extends Label

func _ready():
    self.text = str(Calcule.get_algae()) + " Micro-Algue"
    Calcule.new_day.connect(Callable(self, "upgate_gui"))

func upgate_gui():
    self.text = str(Calcule.get_algae()) + " Micro-Algue"
