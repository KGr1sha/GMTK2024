class_name KeyForDoor
extends Node2D

var area : Area2D
var sound : AudioStreamPlayer2D
var light : PointLight2D
var animated_sprite : AnimatedSprite2D


func _ready() -> void:
	area = get_node("Area2D")
	sound = get_node("AudioStreamPlayer2D")
	light = get_node("PointLight2D")
	animated_sprite = get_node("AnimatedSprite2D")
	
	area.body_entered.connect(_on_key_touched)


func _on_key_touched(body : Node2D) -> void:
	sound.play()
	animated_sprite.hide()
	light.hide()
	await sound.finished
	var key_collecter : KeyCollecter = body.get_node("KeyCollecter")
	if key_collecter == null:
		return
	
	key_collecter.give_key()
	queue_free()
