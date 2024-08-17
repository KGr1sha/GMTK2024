extends CharacterBody2D


const SPEED = 80.0
const JUMP_VELOCITY = -200.0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ScaleDown"):
		scale /= 2.0
		$Camera2D.zoom *= 2.0
	if Input.is_action_just_pressed("ScaleUp"):
		scale *= 2.0
		$Camera2D.zoom /= 2.0
	
	
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("MoveLeft", "MoveRight")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
