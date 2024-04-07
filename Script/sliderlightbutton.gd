extends HSlider

func _ready():
    self.value = Calcule.input["alpha"] * 100
