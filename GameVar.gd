extends Node

### Input ###

@export var light: float
@export var dilution: float
@export var glucose: float

### Output ###

@export var algae: float
@export var yield_reactor: float
@export var production_need: float

func init():
    light = 0
    dilution = 0
    glucose = 0
    algae = 0
    yield_reactor = 0
    production_need = 0

