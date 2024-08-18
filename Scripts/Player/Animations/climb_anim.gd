class_name ClimbAnim
extends State


@export var animated_sprite : AnimatedSprite2D


func enter() -> void:
	animated_sprite.play("run")


func _process(_delta: float) -> void:
	pass

