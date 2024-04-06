extends Node

### Matières premières ###

@export var light: float
@export var dilution: float
@export var glucose: float

### Produits ###

@export var algae: float
@export var bacteria: float

func init():
    light = 0
    dilution = 0
    glucose = 0
    algae = 0
    bacteria = 0
