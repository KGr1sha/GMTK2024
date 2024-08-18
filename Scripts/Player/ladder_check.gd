class_name LadderCheck
extends Area2D


var is_on_ladder : bool


func _ready() -> void:
	area_entered.connect(_on_enter)
	area_exited.connect(_on_exit)
	is_on_ladder = false


func _on_enter(_area : Area2D) -> void:
	is_on_ladder = true


func _on_exit(_area : Area2D) -> void:
	is_on_ladder = false

