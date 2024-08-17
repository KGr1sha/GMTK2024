class_name KeyForDoor
extends Node2D


func _ready() -> void:
	var area : Area2D = get_node("Area2D")
	area.body_entered.connect(_on_key_touched)


func _on_key_touched(body : Node2D) -> void:
	var key_collecter : KeyCollecter = body.get_node("KeyCollecter")
	if key_collecter == null:
		return

	key_collecter.give_key()
	queue_free()
