class_name PlayerMovement
extends FSM


var ladder_check : LadderCheck


func _ready() -> void:
	super()
	ladder_check = get_node("../LadderCheck")


func _process(delta: float) -> void:
	super(delta)
	if ladder_check.near_ladder and Input.is_action_just_pressed("Climb"):
		change_state("ClimbState")
