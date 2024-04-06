extends Node

"""
Load when all node ready
"""
func _ready():
	#setup_label()
	pass

func _process(float):
	setup_label()
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
		#Potenciellement inutile
		value = value + 0.0
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
	if check_death():
		#TODO: Action when player loose
		print("Perdu")
	_private_update_output()
	_private_update_day()
	print_all_vars()

"""
Function for calcul output: yield_reactor
"""
func _private_f1() -> float:
	var m_light = GameVar.game_input["light"]
	var m_dilution = GameVar.game_input["dilution"]
	var m_glucose = GameVar.game_input["glucose"]
	#TODO: Complete the calcule
	var r = 0
	return 0.0

"""
Function for calcul output: algae
"""
func _private_f2() -> float:
	var m_light = GameVar.game_input["light"]
	var m_dilution = GameVar.game_input["dilution"]
	var m_glucose = GameVar.game_input["glucose"]
	var m_yield_reactor = GameVar.game_output["yield_reactor"]
	#TODO: complete the calcule 
	var r = 0
	return 0.0

"""
Calcul the new value of output for new day
"""
func _private_update_output():
	#TODO: Place reel equation
	"""
	Algo:
		Calcule yield_reactor
		Actualiser la valeur de yield_reactor (f1)
		Calculer algae
		Actualiser la valeur de algae (f2)
	"""
	GameVar.game_output["algae"] += 0.1
	GameVar.game_output["yield_reactor"] += 0.1
	

"""
Update time game (add 1 to day)
"""
func _private_update_day():
	GameVar.time["day"] += 1

"""
Print all var in terminal 
"""
func print_all_vars():
	print("immunity_day: ", GameVar.immunity_day)
	print("game_intput: ", GameVar.game_input)
	print("game_output: ", GameVar.game_output)
	

"""
Return all game variable (use for label print)
"""
func _private_dump_all_value_string() -> String:
	var s = "immunity_day: " + str(GameVar.immunity_day) + "\n"
	s += "game_intput: " + str(GameVar.game_input) + "\n"
	s += "game_output: " +  str(GameVar.game_output) + "\n"
	s += "day: " + str(GameVar.time) + "\n"
	return str(s)
	


"""
Function link to light slider
"""
func slider_light(v: float):
	#TODO: add in parameters value of slider
	print("[*] slider light used")
	if not modify_input("light", v):
		printerr("[-] Error click button, value modify_input slider_light")

"""
Function link to dilution slider
"""
func slider_dilution(v: float):
	#TODO: add in parameters value of slider
	print("[*] slider dilution used")
	if not modify_input("dilution", v):
		printerr("[-] Error click button, value modify_input slider_dilution")
	

"""
Function link to glucose slider
"""
func slider_glucose(v: float):
	#TODO: add in parameters value of slider
	print("[*] slider glucose used")
	if not modify_input("glucose", v):
		printerr("[-] Error click button, value modify_input slider_dilution")

# Préchargez vos textures
var texture1 = preload("res://Script/full.png")
var texture2 = preload("res://Script/full2.png")

# Variable pour suivre l'état du bouton
var is_first_image = true

"""
Function link buttom to next day
"""
func next_day():
	# Référence à votre TextureRect
	var image = get_node("%troll")
	# Changez la texture de l'image lorsque le bouton est pressé
	if is_first_image:
		image.texture = texture2
	else:
		image.texture = texture1
	# Inversez l'état du bouton
	is_first_image = !is_first_image
	print("[*] Next day pressed")
	_private_progress_day()


func setup_label():
	var my_label = get_node("%Label")
	##$Label.text = str("test")
	if my_label != null:
		my_label.text = str(_private_dump_all_value_string())
	else:
		printerr("[-] Label node is not initialized")

func _on_nextdaybutton_pressed():
	next_day()

func _on_label_ready():
	setup_label() # Replace with function body.

func _on_sliderlightbutton_value_changed(value):
	slider_light(value)

func _on_sliderdilution_value_changed(value):
	slider_dilution(value)

func _on_sliderglucose_value_changed(value):
	slider_glucose(value)


