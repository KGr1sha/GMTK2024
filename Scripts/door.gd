class_name Door
extends Node2D


@export var locks : Array[Lock]


func _ready() -> void:
	for lock : Lock in locks:
		lock.unlocked.connect(try_open)


func try_open() -> void:
	if all_opened():
		print("Open")


func all_opened() -> bool:
	for lock : Lock in locks:
		if not lock.opened:
			return false

	return true

