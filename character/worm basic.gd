var gravity = -500

func _ready():
	InputMap.action_add_event("jump", KEY_SPACE)
	set_physics_process(true)

func _physics_process(delta):
	var motion = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		motion.x += 1
	if Input.is_action_pressed("ui_left"):
		motion.x -= 1

	if Input.is_action_pressed("ui_down"):
		motion.y += 1
	if Input.is_action_pressed("ui_up"):
		motion.y -= 1

	var jump_force = Vector2.ZERO

	if is_jumping:
		jump_force.y += gravity * delta
		move_and_collide(jump_force)

	motion = motion.normalized() * speed * delta
	motion.y += gravity * delta
	move_and_collide(motion)

	if is_on_floor():
		is_jumping = false
