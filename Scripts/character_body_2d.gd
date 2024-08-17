class_name PlayerMovement
extends CharacterBody2D

const SPEED = 40.0
const JUMP_VELOCITY = -200.0

@export var cyotee_jump_window : float = 0.05
var cyotee_timer : float

var speed_scale : float = 1.0
var jump_scale : float = 1.0

var horizontal_input : float
var want_to_jump : bool


func _ready() -> void:
	cyotee_timer = cyotee_jump_window


func _process(delta: float) -> void:
	horizontal_input = Input.get_axis("MoveLeft", "MoveRight")
	want_to_jump = want_to_jump or Input.is_action_just_pressed("Jump")

	if not want_to_jump:
		cyotee_timer -= delta

	if cyotee_timer <= 0:
		cyotee_timer = cyotee_jump_window
		want_to_jump = false


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if want_to_jump and is_on_floor():
		velocity.y = JUMP_VELOCITY * jump_scale
		want_to_jump = false

	# Horizontal movement
	if horizontal_input:
		velocity.x = horizontal_input * SPEED * speed_scale
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * speed_scale)

	move_and_slide()
