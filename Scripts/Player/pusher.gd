class_name Pusher
extends Node2D


@export var move_state : PlayerMoveState
@export var scaler : Scaler
var push_body : StaticBody2D
var push_detector : Area2D
var can_push : bool
var collision_shape : CollisionShape2D


func _ready() -> void:
	push_detector = get_node("PushDetector")
	collision_shape = get_node("StaticBody2D/CollisionShape2D")
	push_body = get_node("StaticBody2D")
	push_detector.body_entered.connect(on_push)
	push_detector.body_exited.connect(off_push)


func on_push(_body : Node2D) -> void:
	if not get_current_scale().can_push:
		push_body.set_collision_layer_value(6, false)
	else:
		move_state.speed_scale = get_current_scale().move_speed / 2


func off_push(_body : Node2D) -> void:
	push_body.set_collision_layer_value(6, true)
	move_state.speed_scale = get_current_scale().move_speed


func get_current_scale() -> ScaleSettings:
	return scaler.current_scale
