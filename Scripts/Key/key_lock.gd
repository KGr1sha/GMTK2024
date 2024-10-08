class_name KeyLock
extends Lock
#lock that uses key


var can_open : bool
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
	if Input.is_action_just_pressed("Interact")\
	and can_open and opened == false:
		unlock()


func _on_enter(other : Node2D) -> void:
	var collecter : KeyCollecter = other.get_node("KeyCollecter")
	if collecter != null and collecter.current_keys > 0:
		can_open = true


func _on_exit(_other : Node2D) -> void:
	can_open = false
