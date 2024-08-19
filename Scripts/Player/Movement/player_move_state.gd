class_name PlayerMoveState
extends State


const SPEED = 40.0
const JUMP_VELOCITY = -200.0

@export var body : CharacterBody2D
@export var cyotee_jump_window : float = 0.05
@export var animator : FSM
var ladder_check : LadderCheck
var cyotee_timer : float

var speed_scale : float = 1.0
var jump_scale : float = 1.0

var horizontal_input : float
var vertical_input : float
var want_to_jump : bool


func _ready() -> void:
	cyotee_timer = cyotee_jump_window
	ladder_check = get_node("../../LadderCheck")


func process(delta: float) -> void:
	horizontal_input = Input.get_axis("MoveLeft", "MoveRight")
	vertical_input = Input.get_axis("Climb", "Drop")
	want_to_jump = want_to_jump or Input.is_action_just_pressed("Jump")

	if ladder_check.is_on_ladder\
	and vertical_input\
	and horizontal_input == 0:
		fsm.change_state("ClimbState")
		animator.change_state("Climb")

	if want_to_jump:
		cyotee_timer -= delta

	if cyotee_timer <= 0:
		cyotee_timer = cyotee_jump_window
		want_to_jump = false


func physics_process(delta: float) -> void:
	# Add the gravity.
	if not body.is_on_floor():
		body.velocity += body.get_gravity() * delta

	# Handle jump.
	if want_to_jump and body.is_on_floor():
		body.velocity.y = JUMP_VELOCITY * jump_scale
		want_to_jump = false

	# Horizontal movement
	if horizontal_input:
		body.velocity.x = horizontal_input * SPEED * speed_scale
	else:
		body.velocity.x = move_toward(body.velocity.x, 0, SPEED * speed_scale)

	body.move_and_slide()
