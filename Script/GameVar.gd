extends Node

### Global ###
"""
All global var
"""
#It's number action when the player can lose
#Action is when player click on next 
@export var immunity_action = 0


#Minimal value needed 
@export var start_minimal_algea = 100
@export var startminimal_yield_reactor = 100

#Time value
@export var slider_time_value = 1
@export var time_in_game = 0

var time_in_game_test:
    set(value):
        call_test()


### Input ###
#DEVALUATE
@export var game_input = {
    "light" = 0.0,
    "dilution" = 0.0,
    "glucose" = 0.0
}

func call_test():
    print("test")


### Output ###
##Yeild_reactor = number bacterie
#DEVALUATE
@export var game_output = {
    "algae" = 0.0,
    "yield_reactor" = 0.0
}

### Time ###
@export var action_player = {
    "nb_action": 0
}

### Objectif minimal output ###
@export var minimal_objective = {
    "minimal_algea" = 0,
    "minimal_yield_reactor" = 0
}

#func init():
#	GameVar.time["day"] = 0.0
    

