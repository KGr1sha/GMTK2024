class_name PlayerClimbState
extends State


@export var body : CharacterBody2D
@export var climb_speed : float = 10.0
var vertical_input : float
var horizontal_input : float




func process(_delta : float) -> void:
	vertical_input = Input.get_axis("Climb", "Drop")
	horizontal_input = Input.get_axis("MoveLeft", "MoveRight")
	if Input.is_action_just_pressed("Jump")\
		or horizontal_input != 0:
		# or is not on ladder
		fsm.change_state("MoveState")


func physics_process(_delta: float) -> void:
	body.velocity.y = vertical_input * climb_speed
	print(body.velocity.y)
	body.move_and_slide()
