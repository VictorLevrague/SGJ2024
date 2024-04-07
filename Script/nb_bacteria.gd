extends Label

func _ready():
    self.text = str(Calcule.get_bacteria()) + " Bacterie"
    Calcule.new_day.connect(Callable(self, "update_gui"))

func update_gui():
    self.text = str(Calcule.get_bacteria()) + " Bacterie"
