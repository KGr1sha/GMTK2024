class_name FSM
extends Node


@export var initial_state : State
var current_state : State
var states : Dictionary = {} # key - state name; # val - state instance


func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.fsm = self
	
	change_state(initial_state.name)


func _process(delta: float) -> void:
	if current_state != null:
		current_state.process(delta)


func _physics_process(delta: float) -> void:
	if current_state != null:
		current_state.physics_process(delta)


func change_state(new_state_name: String) -> void:
	var new_state = states[new_state_name]
	
	if current_state:
		current_state.exit()
	
	new_state.enter()
	
	current_state = new_state
