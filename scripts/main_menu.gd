extends Node2D


func _on_new_game_button_pressed():
	get_tree().change_scene_to_file("res://scenes/map.001.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_made_by_button_pressed():
	get_tree().change_scene_to_file("res://scenes/MadeBy.tscn")
