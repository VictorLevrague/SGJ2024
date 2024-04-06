extends Label

func _ready():
    self.text = "Score : 0"
    Calcule.new_day.connect(Callable(self, "update_gui"))

func update_gui():
    self.text = "Score : " + str(Calcule.get_score())
