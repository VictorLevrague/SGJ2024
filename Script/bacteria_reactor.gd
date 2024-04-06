extends Control

#@onready var game_var = %GameVar
#var nb_bacteria: int = game_var.bacteria
var nb_bacteria: int = 10
@export var bacteria_scene: PackedScene

func _ready():
    spawn_bacteria(nb_bacteria)

func _get_random_position_in_window() -> Vector2:
    var reactor_size = self.get_size()
    var random_x = randf_range(0 + reactor_size.x / 4, reactor_size.x - reactor_size.x / 4)
    var random_y = randf_range(0 + reactor_size.y / 4, reactor_size.y - reactor_size.y / 4)
    return Vector2(random_x, random_y)

func spawn_bacteria(_nb_bacteria):
    for i in _nb_bacteria:
        var bacteria = bacteria_scene.instantiate()
        bacteria.position = _get_random_position_in_window()
        add_child(bacteria)
        print("bacteria added")


func _on_area_2d_body_entered(body):
    if body is CharacterBody2D:
        body.direction *= -1
