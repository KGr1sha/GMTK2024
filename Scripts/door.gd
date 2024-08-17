class_name Door
extends Node2D


@export var locks : Array[Lock]
var is_opened : bool


func _ready() -> void:
	is_opened = false
	for lock : Lock in locks:
		lock.unlocked.connect(try_open)


func try_open() -> void:
	if is_opened:
		return

	if all_opened():
		is_opened = true
		# TODO: play anim
		print("Open")


func all_opened() -> bool:
	for lock : Lock in locks:
		if not lock.opened:
			return false

	return true
