class_name IdleAnim
extends State


@export var animated_sprite : AnimatedSprite2D


func enter() -> void:
	animated_sprite.play("idle")


func _process(_delta: float) -> void:
	if Input.get_axis("MoveLeft", "MoveRight"):
		fsm.change_state("Run")

