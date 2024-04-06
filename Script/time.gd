extends Label

func _ready():
    self.text = "Jour " + str(0)

func _process(float):
    var day = GameVar.time_in_game
    self.text = "Jour " + str(day)
