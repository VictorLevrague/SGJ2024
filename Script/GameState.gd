extends Node

func _process(float):
	update_gui()
	

"""
Take value i and return 1 if the type is TYPE_FLOAT
else return 0
"""
func _private_is_float(i) -> int:
	if typeof(i) == TYPE_FLOAT:
		return 1
	else:
		return 0

"""
Take value i and return 1 if the type is TYPE_INT
else return 0
"""
func _private_is_int(i) -> int:
	if typeof(i) == TYPE_INT:
		return 1
	else:
		return 0

"""
Take a string in input, input is name of var and value 
the new value of var
Return 1 if sucess else -1
"""
func modify_input(v: String, value) -> int:
	if _private_is_float(value):
		#TODO: pensez a modifier ici
		value = value + 0.2
		match v:
			"light":
				print("[*] modify ligh")
				GameVar.game_intput["light"] = value
				return 1
			"dilution":
				print("[*] modify dilution")
				GameVar.game_intput["dilution"] = value
				return 1
			"glucose":
				print("[*] modify glucose")
				GameVar.game_intput["glucose"] = value
				return 1
			"algae":
				print("[*] modify algae")
				GameVar.game_intput["algae"] = value
				return 1
			"yield_reactor":
				print("[*] modify yield_reactor")
				GameVar.game_intput["yield_reactor"] = value
				return 1
			"glucose":
				print("[*] modify glucose")
				GameVar.game_intput["glucose"] = value
				return 1
			_:
				printerr("[-] Error name var input in modify_input")
				return -1
	if _private_is_int(value):
		match v:
			"day":
				print("[*] modify day")
				GameVar.game_intput["day"] = value
				return 1
			_:
				printerr("[-] Error name var input input in modify_input")
				return -1
	printerr("[-] Error value is invalid in modify_input")
	return -1


func update_gui():
	pass

"""
Check if the playe is death
Return 1 if player death else 0
"""
func check_death() -> int:
	#Playe wasn't immunity
	if GameVar.time["day"] >= GameVar.immunity_day:
		if GameVar.game_output["algae"] <= 0.0:
			return 1
		else:
			return 0
	return 0

func check_production():
	pass

"""
Update gamestate for new day
"""
func _private_progress_day():
	_private_update_output()
	_private_update_day()

"""
Calcul the new value of output for new day
"""
func _private_update_output():
	#TODO: Place reel equation
	GameVar.game_output["algae"] += 0.1
	GameVar.game_output["yield_reactor"] += 0.1
	GameVar.game_output["glucose"] += 0.1
	

"""
Update time game (add 1 to day)
"""
func _private_update_day():
	GameVar.game_time["day"] += 1

"""
Print all var in terminal 
"""
func print_all_vars():
	print("immunity_day: ", GameVar.immunity_day)
	print("game_intput: ", GameVar.game_intput)
	print("game_output: ", GameVar.game_output)
	print("time: ", GameVar.time)


"""
Function link to light slider
"""
func slider_light():
	#TODO: add in parameters value of slider
	print("[*] slider light used")
	if not modify_input("light", GameVar.game_intput["light"]):
		printerr("[-] Error click button, value modify_input slider_light")

"""
Function link to dilution slider
"""
func slider_dilution():
	#TODO: add in parameters value of slider
	print("[*] slider dilution used")
	if not modify_input("dilution", GameVar.game_intput["dilution"]):
		printerr("[-] Error click button, value modify_input slider_dilution")
	

"""
Function link to glucose slider
"""
func slider_glucose():
	#TODO: add in parameters value of slider
	print("[*] slider glucose used")
	if not modify_input("glucose", GameVar.game_intput["glucose"]):
		printerr("[-] Error click button, value modify_input slider_dilution")


"""
Function link buttom to next day
"""
func next_day():
	print("[*] Next day pressed")
	_private_progress_day()
