class_name LadderCheck
extends Area2D


var near_ladder : bool


func _ready() -> void:
	area_entered.connect(_on_enter)
	area_exited.connect(_on_exit)
	near_ladder = false


func _on_enter(_area : Area2D) -> void:
	near_ladder = true


func _on_exit(_area : Area2D) -> void:
	near_ladder = false

