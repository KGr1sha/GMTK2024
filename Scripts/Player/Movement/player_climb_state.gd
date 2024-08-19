class_name PlayerClimbState
extends State


@export var body : CharacterBody2D
@export var climb_speed : float = 10.0
var ladder_check : LadderCheck
var vertical_input : float
var horizontal_input : float


func _ready() -> void:
	ladder_check = get_node("../../LadderCheck")


func process(_delta : float) -> void:
	vertical_input = Input.get_axis("Climb", "Drop")
	horizontal_input = Input.get_axis("MoveLeft", "MoveRight")
	if Input.is_action_just_pressed("Jump")\
	or (horizontal_input != 0 and vertical_input == 0)\
	or not ladder_check.is_on_ladder\
	or body.is_on_floor():
		fsm.change_state("MoveState")


func physics_process(_delta: float) -> void:
	body.velocity.y = vertical_input * climb_speed
	body.move_and_slide()
