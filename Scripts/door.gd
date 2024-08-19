class_name Door
extends Node2D


@export var locks : Array[Lock]
var is_opened : bool
var animated_sprite : AnimatedSprite2D


func _ready() -> void:
	animated_sprite = get_node("AnimatedSprite2D")
	is_opened = false
	for lock : Lock in locks:
		lock.unlocked.connect(try_open)


func try_open() -> void:
	if is_opened and not all_opened():
		animated_sprite.play("open", -1, true)
		return

	if all_opened():
		is_opened = true
		animated_sprite.play("open")


func all_opened() -> bool:
	for lock : Lock in locks:
		if not lock.opened:
			return false

	return true
