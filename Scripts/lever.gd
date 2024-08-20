class_name Lever
extends Lock


var player_in_range : bool
var area : Area2D
var sound : AudioStreamPlayer2D
var animated_sprite : AnimatedSprite2D

func _ready() -> void:
	area = get_node("Area2D")
	sound = get_node("AudioStreamPlayer2D")
	animated_sprite = get_node("AnimatedSprite2D")
	
	area.body_entered.connect(_on_enter)
	area.body_exited.connect(_on_exit)


func unlock() -> void:
	opened = true
	sound.play()
	animated_sprite.play()
	unlocked.emit()


func _process(_delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("Interact") and opened == false:
		unlock()


func _on_enter(_other : Node2D) -> void:
	player_in_range = true


func _on_exit(_other : Node2D) -> void:
	player_in_range = false
