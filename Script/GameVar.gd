extends Node

### Global ###
"""
All global var
"""
#It's day when the player can lose
@export var immunity_day = 20


#Minimal value needed 
@export var start_minimal_algea = 100
@export var startminimal_yield_reactor = 100

#Time value
@export var time_in_game = 1


### Input ###
@export var game_input = {
	"light" = 0.0,
	"dilution" = 0.0,
	"glucose" = 0.0
}


### Output ###
##Yeild_reactor = number bacterie
@export var game_output = {
	"algae" = 0.0,
	"yield_reactor" = 0.0
}

### Time ###
@export var time = {
	"day": 0
}

### Objectif minimal output ###
@export var minimal_objective = {
	"minimal_algea" = 0,
	"minimal_yield_reactor" = 0
}

#func init():
#	GameVar.time["day"] = 0.0
	

