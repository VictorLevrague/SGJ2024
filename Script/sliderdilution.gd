extends HSlider

func _ready():
    self.value = Calcule.input["d"] * 100
