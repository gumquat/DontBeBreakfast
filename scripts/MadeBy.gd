extends CanvasLayer


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_evan_pressed():
	OS.shell_open("www.github.com/gumquat")


func _on_caramon_pressed():
	OS.shell_open("www.github.com/caramonh")


func _on_tayler_pressed():
	OS.shell_open("www.github.com/F-O-P")
