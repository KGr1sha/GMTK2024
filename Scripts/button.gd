class_name PressButton
extends Lock


var animated_sprite : AnimatedSprite2D
var area : Area2D


func _ready() -> void:
	animated_sprite = get_node("AnimatedSprite2D")
	area = get_node("Area2D")
	area.body_entered.connect(on_enter)
	area.body_exited.connect(on_exit)


func on_enter(_body : Node2D) -> void:
	unlock()
	animated_sprite.play("press")


func on_exit(_body : Node2D) -> void:
	lock()
	animated_sprite.play("press", -1, true)

