class_name IdleAnim
extends State


@export var animated_sprite : AnimatedSprite2D
var ladder_check : LadderCheck


func _ready() -> void:
	ladder_check = get_node("../../LadderCheck")


func enter() -> void:
	animated_sprite.play("idle")


func process(_delta: float) -> void:
	if Input.get_axis("MoveLeft", "MoveRight"):
		fsm.change_state("Run")
	elif is_climbing():
		fsm.change_state("Climb")
	

func is_climbing() -> bool:
	var controller : FSM = get_node("../../MovementController")
	return controller.states["ClimbState"] == controller.current_state

