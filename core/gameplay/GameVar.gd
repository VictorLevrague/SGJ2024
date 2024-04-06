extends Node

### Global ###
"""
All global var
"""
#It's day when the player can lose
@export var immunity_day = 20

### Input ###
@export var game_intput = {
    "light" = 0.0,
    "dilution" = 0.0,
    "glucose" = 0.0
}


### Output ###
@export var game_output = {
    "algae" = 0.0,
    "yield_reactor" = 0.0,
    "glucose" = 0.0
}

### Time ###
@export var time = {
    "day": 0
}

#func init():
#	GameVar.time["day"] = 0.0
    

