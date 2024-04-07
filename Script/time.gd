extends Label

func _ready():
    self.text = "Jour " + str(0)

func _process(float):
    var day = GameVar.time_in_game
    if GameVar.gui_day == 0:
        self.text = str(GameVar.gui_hours) + " h"
    else:
        self.text = "Jour " + str(GameVar.gui_day) + ": " + str(GameVar.gui_hours) + " h"
