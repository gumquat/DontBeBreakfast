extends CharacterBody2D

@onready var jump = $jump
@onready var walking = $walking
@onready var flipPoint = $flipPoint


const SPEED = 100.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# gravity!!!
	if not is_on_floor():
		velocity.y += gravity * delta
		
	#FIND HOW TO IMPLEMENT THIS	BETTER
	if velocity.x != 0 and is_on_floor():
		if !walking.playing:
			$walking.play()
		elif walking.playing:
			$walking.stop()

	# jump handling
	if Input.is_action_pressed("jump") and is_on_floor():
		$jump.play()
		velocity.y = JUMP_VELOCITY
		
	# gets players input direction and handles the movement
	# DO LATER --> replace UI actions with custom gameplay actions
	var direction = Input.get_axis("move_left", "move_right")
	if direction < 0:
		flipPoint.scale.x = -1
	elif direction > 0:
		flipPoint.scale.x = 1
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()

							#DEATH TRIGGERS
func _on_spikes_body_entered(body):
	get_tree().change_scene_to_file("res://scenes/GameOver.tscn")

func _on_water_body_entered(body):
	get_tree().change_scene_to_file("res://scenes/GameOver.tscn")

func _on_victory_flag_body_entered(body):
	get_tree().change_scene_to_file("res://scenes/Victory.tscn")
