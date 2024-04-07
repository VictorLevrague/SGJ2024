extends Control

var nb_bacteria: int = Calcule.get_bacteria()
var nb_algae: int = Calcule.get_bacteria()
@export var bacteria_scene: PackedScene
var bacteria_list: Array
var algae_list: Array

func _ready():
    spawn_bacteria(nb_bacteria)
    spawn_algae(nb_algae)
    Calcule.new_day.connect(Callable(self, "update_reactor"))

func _get_random_position_in_window() -> Vector2:
    var reactor_size = self.get_size()
    var random_x = randf_range(0 + reactor_size.x / 4, reactor_size.x - reactor_size.x / 4)
    var random_y = randf_range(0 + reactor_size.y / 4, reactor_size.y - reactor_size.y / 4)
    return Vector2(random_x, random_y)

func spawn_bacteria(_nb_bacteria):
    for i in _nb_bacteria:
        var bacteria = bacteria_scene.instantiate()
        bacteria.type = 0
        bacteria.position = _get_random_position_in_window()
        add_child(bacteria)
        bacteria_list.append(bacteria)

func spawn_algae(_nb_algae):
    for i in _nb_algae:
        var bacteria = bacteria_scene.instantiate()
        bacteria.type = 1
        bacteria.position = _get_random_position_in_window()
        add_child(bacteria)
        algae_list.append(bacteria)

func _on_area_2d_body_entered(body):
    if body is CharacterBody2D:
        body.direction *= -1

func update_reactor():
    print("bact: ", Calcule.get_bacteria() - nb_bacteria)
    if (Calcule.get_bacteria() < 100) and (Calcule.get_bacteria() - nb_bacteria) >= 0:
        spawn_bacteria(Calcule.get_bacteria() - nb_bacteria)
    elif (Calcule.get_bacteria() - nb_bacteria) < 0:
        for i in (nb_bacteria - Calcule.get_bacteria()):
            if len(bacteria_list) > 0:
                bacteria_list[0].queue_free()
                bacteria_list.remove_at(0)
    elif (Calcule.get_bacteria() > 100):
        spawn_bacteria(2)
    
    print("algue: ", Calcule.get_algae() - nb_algae)
    if Calcule.get_algae() < 100 and (Calcule.get_algae() - nb_algae) >= 0:
        spawn_algae(Calcule.get_algae() - nb_algae)
    elif (Calcule.get_algae() - nb_algae) < 0:
        for i in (nb_algae - Calcule.get_algae()):
            if len(algae_list) > 0:
                algae_list[0].queue_free()
                algae_list.remove_at(0)
    elif (Calcule.get_algae() > 100):
        spawn_algae(2)

    nb_bacteria = Calcule.get_bacteria()
    nb_algae = Calcule.get_algae()
    
