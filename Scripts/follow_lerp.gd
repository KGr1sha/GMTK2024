class_name Follow
extends Node2D


@export var target : Node2D
@export var min_distance : float
@export var follow_speed : float = 0.1
var t : float


func _physics_process(delta: float) -> void:
	if position.distance_to(target.position) <= min_distance:
		t = 0
		return

	var to_target = target.position - position

	t += delta * 0.01
	position = position.lerp(target.position - to_target.normalized() * min_distance, t)
