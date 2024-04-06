@tool
extends EditorPlugin


func _enter_tree():
    add_autoload_singleton("SceneLoader", "res://addons/maaacks_game_template/base/scripts/SceneLoader.gd")
    
func _exit_tree():
    remove_autoload_singleton("")

