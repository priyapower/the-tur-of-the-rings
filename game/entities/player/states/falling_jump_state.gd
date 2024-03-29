class_name FallingJumpState
extends State


## BEHAVIORS
func enter() -> void:
	super()


func process_input(event: InputEvent) -> State:
	## Handle sprite direction
	if event.is_action_pressed("left"):
		parent.sprite.scale.x = abs(parent.sprite.scale.x) * -1
	if event.is_action_pressed("right"):
		parent.sprite.scale.x = abs(parent.sprite.scale.x)

	return null


func process_physics(delta) -> State:
	## Capture horizontal axis integer
	var horizontal_direction: float = move_component.get_horizontal_movement()

	## Add gravity and movement
	parent.velocity.y += gravity * delta
	parent.move_and_slide()

	## Handle horizontal velocity
	if horizontal_direction != 0:
		parent.velocity.x = horizontal_direction * (run_speed * fall_velocity_scale)
	else:
		parent.velocity.x = 0

	## Handle transitions
	if parent.is_on_floor():
		transitioned.emit("IdlingJumpState", self)

	return null
