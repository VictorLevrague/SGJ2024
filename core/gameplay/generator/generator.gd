class_name Generator
extends Control

@onready var label : Label = %Label 

@export var button : Button

@export var timer : Timer

var products : int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	update_text()

func create_products():
	products =+ 1
	update_text()

func update_text():
	label.text = "Products : %s" 


##func begin_generating_products():
	##timer.start()
	##button.disabled = true
	

func _on_button_pressed():
	create_products()


##func _on_timer_timeout():
	##create_products()
