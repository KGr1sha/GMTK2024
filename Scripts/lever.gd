class_name Lever
extends Lock


var player_in_range : bool
var area : Area2D


func _ready() -> void:
	area = get_node("Area2D")
	area.body_entered.connect(_on_enter)
	area.body_exited.connect(_on_exit)


func _process(_delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("Interact"):
		unlock()


func _on_enter(_other : Node2D) -> void:
	player_in_range = true


func _on_exit(_other : Node2D) -> void:
	player_in_range = false

