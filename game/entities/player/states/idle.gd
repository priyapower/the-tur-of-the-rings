extends State

@export var fall_state: State
@export var jump_state: State
@export var run_state: State

func enter() -> void:
	super()
	parent.velocity.x = 0

func process_input(event: InputEvent) -> State:
	# Handle sprite direction
	if event.is_action_pressed("left"):
		parent.sprite.scale.x = abs(parent.sprite.scale.x) * -1
	if event.is_action_pressed("right"):
		parent.sprite.scale.x = abs(parent.sprite.scale.x)

	return null

func process_physics(delta: float) -> State:
	var horizontal_direction = Input.get_axis('left', 'right')
	var no_vertical_movement = parent.velocity.y == 0
	
	# Add the gravity
	parent.velocity.y += gravity * delta
	
	# Handle idle
	parent.move_and_slide()
	
	# Handle state transitions
	if parent.is_on_floor():
		if no_vertical_movement && horizontal_direction != 0:
			return run_state
		if Input.is_action_just_pressed('jump'):
			return jump_state

	else:
		# Handle state transitions (if player starts above ground)
		if parent.velocity.y >= 0:
			return fall_state
		
	return null