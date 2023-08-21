extends CharacterBody2D

const speed = 95.0
@export var player: Node2D
@onready var navigation_agent := $NavigationAgent2D as NavigationAgent2D

func _physics_process(delta: float) -> void:
	var dir = to_local(navigation_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()

func makepath() -> void:
	navigation_agent.target_position = player.global_position

func _on_timer_timeout():
	makepath()

func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	get_tree().change_scene_to_file("res://scenes/GameOver.tscn")
