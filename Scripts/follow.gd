class_name Follow
extends Node2D


@export var target : CharacterBody2D
@export var acceleration : float = 0.1
@export var max_speed : float = 6.0
@export var offset_distance = 1.0
@export var default_offset : Vector2 = Vector2.UP
@export var break_distance : float
var speed : float


func _physics_process(delta: float) -> void:
	var offset : Vector2 = target.velocity.normalized()\
						* offset_distance
	if offset == Vector2.ZERO:
		offset = default_offset

	var distance : float = global_position.distance_to(
		target.global_position + offset
	)
	var to_target = (
		target.global_position + offset - global_position
	).normalized()

	if distance <= 1:
		speed = target.velocity.length()
		return

	speed = clamp(speed + acceleration * delta, 0, max_speed)
	
	if global_position.distance_to(
		target.global_position + offset
	) <= break_distance:
		speed = clamp(speed, 0, target.velocity.length())

	position += to_target * speed * delta
