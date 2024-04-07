extends HSlider

func _ready():
    self.value = Calcule.input["s_in"] * 100
