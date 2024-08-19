class_name FollowLerp
extends Node2D


@export var target : CharacterBody2D
@export var offset_distance = 1.0
@export var default_offset : Vector2 = Vector2.UP
@export var offset_speed : float
@export var follow_speed : float
@export var min_distance : float
var offset_position : Vector2
var t_offset : float
var t_follow : float


func _physics_process(delta: float) -> void:
	move_offset(delta)
	position = offset_position


func move_offset(delta : float) -> void:
	var target_offset : Vector2 = target.global_position + target.velocity.normalized()\
						* offset_distance
	if target_offset == Vector2.ZERO:
		target_offset = default_offset
	
	#if offset_position.distance_to(target_offset) <= min_distance:
	#	t_offset = 0
	#	return
	
	t_offset += delta * offset_speed
	offset_position = offset_position.lerp(target_offset, t_offset)
	
