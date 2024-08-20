class_name Door
extends Node2D


@export var next_scene : PackedScene
@export var locks : Array[Lock]
var is_opened : bool
var animated_sprite : AnimatedSprite2D
var sound : AudioStreamPlayer2D
var area : Area2D
var player_near : bool


func _ready() -> void:
	animated_sprite = get_node("AnimatedSprite2D")
	sound = get_node("AudioStreamPlayer2D")
	area = get_node("Area2D")
	is_opened = false
	for lock : Lock in locks:
		lock.unlocked.connect(try_open)
	
	area.body_entered.connect(on_hover)
	area.body_exited.connect(on_exit)


func _process(_delta: float) -> void:
	if player_near and Input.is_action_just_pressed("Interact"):
		get_tree().change_scene_to_packed(next_scene)


func try_open() -> void:
	if is_opened and not all_opened():
		animated_sprite.play("open", -1, true)
		return

	if all_opened():
		is_opened = true
		animated_sprite.play("open")
		await animated_sprite.animation_finished
		sound.play()


func all_opened() -> bool:
	for lock : Lock in locks:
		if not lock.opened:
			return false

	return true


func on_hover(_body : Node2D) -> void:
	player_near = true


func on_exit(_body : Node2D) -> void:
	player_near = false

