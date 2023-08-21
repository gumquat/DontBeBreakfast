extends CanvasLayer



func _on_restart_pressed():
	get_tree().change_scene_to_file("res://scenes/map.001.tscn")


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
