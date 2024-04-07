extends Node

"""
Load when all node ready
"""
func _ready():
	#setup_label()
	pass

func _process(float):
	#
	#setup_label()
	update_gui()
	

"""
Take value i and return 1 if the type is TYPE_FLOAT
else return 0
DEVALUATE
"""
func _private_is_float(i) -> int:
	if typeof(i) == TYPE_FLOAT:
		return 1
	else:
		return 0

"""
Take value i and return 1 if the type is TYPE_INT
else return 0
DEVALUATE
"""
func _private_is_int(i) -> int:
	if typeof(i) == TYPE_INT:
		return 1
	else:
		return 0

"""
Private function
Take a string in input, input is name of var and value 
the new value of var
Return 1 if sucess else -1
"""
func modify_input(v: String, value) -> int:
	#TODO: pensez a modifier ici
	#Potenciellement inutile
	value = value + 0.0
	match v:
		"light":
			print("[*] modify ligh")
			#GameVar.game_input["light"] = value
			Calcule.input["alpha"] = value
			return 1
		"dilution":
			print("[*] modify dilution")
			#GameVar.game_input["dilution"] = value
			Calcule.input["d"] = value
			return 1
		"glucose":
			print("[*] modify glucose")
			#GameVar.game_input["glucose"] = value
			Calcule.input["s_in"] = value
			return 1
		_:
			printerr("[-] Error name var input in modify_input")
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
	#TODO: add verification to minamal produc
	#Playe wasn't immunity
	#Ancien valauer 0.001 
	var epsilon = 0.01
	var c = Calcule.state["c"]
	if c <= (0.0 + epsilon):
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
		print("Perdu")
		SceneLoader.load_scene("res://Examples/Scenes/FailureScreen/FailureScreenWithScenes.tscn")
	#TODO: add update mimale produce
	_private_update_day()    #Fait
	GameVar.conv_hours_in_day_hours()
	_private_update_output() #Fait
	
	print_all_vars()
	_private_dump_value_terminal()
	#CHECK VALUE OF GAME STATE
	_private_check_value()

"""
Function for calcul output: yield_reactor
DEVALUATE
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
DEVALUATE
"""
func _private_f2() -> float:
	var m_light = GameVar.game_input["light"]
	var m_dilution = GameVar.game_input["dilution"]
	var m_glucose = GameVar.game_input["glucose"]
	##var m_yield_reactor = GameVar.game_output["yield_reactor"]
	#TODO: complete the calcule 
	var r = 0
	return 0.0

"""
Update minimale produce
Devaluate
"""
func _private_minimal_produce_update():
	#TODO: A faire
	pass

"""
Calcul the new value of output for new day
"""
func _private_update_output():
	Calcule.update_state(GameVar.time_in_game, Calcule.state, Calcule.input)
	#GameVar.game_output["algae"] += 0.1
	#GameVar.game_output["yield_reactor"] += 0.1
	

"""
Update time game (add 1 to day)
"""
func _private_update_day():
	#GameVar.time_in_game = GameVar.time_in_game + 24
	GameVar.time_in_game = GameVar.time_in_game + GameVar.slider_time_value
	GameVar.action_player["nb_action"] += 1

"""
Print all var in terminal 
"""
func print_all_vars():
	print("immunity_day: ", GameVar.immunity_action)
	print("game_output: ", GameVar.game_output)
	

"""
Return all game variable (use for label print)
"""
func _private_dump_all_value_string() -> String:
	var s = "immunity_day: " + str(GameVar.immunity_action) + "\n"
	s += "game_state: " + str(Calcule.state) + "\n"
	s += "game_input: " +  str(Calcule.input) + "\n"
	s += "hour: " + str(GameVar.time_in_game) + "\n"
	s += "Time silder: " +str(GameVar.slider_time_value) + "\n"
	s += "Day : " + str(GameVar.gui_day) + " hours: " + str(GameVar.gui_hours) + "\n"
	return str(s)
	

func _private_dump_value_terminal():
	print(str(_private_dump_all_value_string()))

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

func slider_timer(v: int):
	print("[*] slider timer used")
	GameVar.slider_time_value = v

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


#func setup_label():
	#var my_label = get_node("%Label")
	###$Label.text = str("test")
	#if my_label != null:
		#my_label.text = str(_private_dump_all_value_string())
	#else:
		#printerr("[-] Label node is not initialized")

func _on_nextdaybutton_pressed():
	next_day()

func _on_label_ready():
	#setup_label() # Replace with function body.

"""
Convert slider light in using value
f: [0-100] -> [0-1]
	x      -> (x/100)
"""
func _private_conv_light(value) -> float:
	return (value / 100)

"""
Convert slider dilution in using value
f: [0-100] -> [0-2]
	x      -> (x/50)
"""
func _private_conv_dilution(value) -> float:
	return (value / 50)

"""
Convert slider glucose in using value
f: [0-100] -> [0-5]
	x      -> (x/20)
"""
func _private_conv_glucose(value) -> float:
	return (value / 20)

"""
Convert slider time in using value
f: [0-100] -> [0-10]
	x      -> (x/10)
"""
func _private_conv_time(value) -> float:
	return (value / 10) 

func _on_sliderlightbutton_value_changed(value):
	value = _private_conv_light(value)
	print("Slider light: " + str(value))
	slider_light(value)

func _on_sliderdilution_value_changed(value):
	value = _private_conv_dilution(value)
	print("Slider dilution: " + str(value))
	slider_dilution(value)

func _on_sliderglucose_value_changed(value):
	value = _private_conv_glucose(value)
	print("Slider glucose: " + str(value))
	slider_glucose(value)

func _on_slidertime_value_changed(value):
	#value = _private_conv_time(value)
	#TODO: Enlever quand le slider est bon
	#Pansement
	#if value == 0:
	#	value = 1
	print("Slider timer: " + str(value))
	slider_timer(value)

func write_to_file(text: String, file_path: String = "res://log_err.txt"):
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	file.store_string(str(text))
	#if error == OK:
	#	file.store_string(text)
	#	file.close()
	#else:
	#	printerr("Erreur lors de l'ouverture du fichier : ", file_path)

"""
Teste value of game
"""
func _private_check_value():
	write_to_file(str(_private_dump_all_value_string()))
	## TEST INPUT VALUE
	var d  = Calcule.input["d"]
	var alpha = Calcule.input["alpha"]
	var s_in  = Calcule.input["s_in"]
	assert(d <= 2 , "Error d > 2")
	assert(d >= 0 , "Error d < 0")
	assert(alpha <= 1 , "Error d > 1")
	assert(alpha >= 0 , "Error d > 0")
	assert(s_in <= 5 , "Error d > 5")
	assert(s_in >= 0 , "Error d > 0")
	
	## TEST SLIDER CONVERTION
	#Time value
	var time_in_game = GameVar.time_in_game
	var slider_time_value = GameVar.slider_time_value
	assert(time_in_game >= 0, "Error time in game is negative")
	assert(slider_time_value >= 1, "Error slider_time_value < 0")
	assert(slider_time_value <= 10, "Error slider_time_value > 10")
	assert(GameVar.gui_day >= 0, "Error gui_day > 0")
	assert(GameVar.gui_hours >= 0, "Error gui_hours > 0")
	assert(typeof(GameVar.gui_day) == TYPE_INT, "Error gui_day is float")
	assert(typeof(GameVar.gui_hours) == TYPE_INT, "Error gui_hours is float")

	## TEST ACTION PLAYER
	var action_player = GameVar.action_player["nb_action"]
	var immunity_action = GameVar.immunity_action
	assert(action_player >= 0, "Error nb of action is negative")
	assert(immunity_action >= 0, "Error immunity action is negative")
	
	## TEST OUTPUT
	assert(Calcule.state["t"] >= 0, "Error t is negatif")
	assert(Calcule.state["s"] >= 0, "Error s is negatif")
	assert(Calcule.state["e"] >= 0, "Error e is negatif")
	assert(Calcule.state["v"] >= 0, "Error v is negatif")
	assert(Calcule.state["c"] >= 0, "Error c is negatif")
	assert(Calcule.state["q"] >= 0, "Error q is negatif")

