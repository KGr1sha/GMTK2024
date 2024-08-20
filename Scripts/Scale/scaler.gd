class_name Scaler
extends Node


@export var default_scale : ScaleSettings
@export var player_root : CharacterBody2D
@export var camera : Camera2D
@export var player_movement : PlayerMoveState
@export var scale_speed : float

var scales : Dictionary #key - scale id; value - ScaleSettings
var current_scale : ScaleSettings

var target_player_scale : Vector2
var target_camera_zoom : Vector2
var t : float
var is_scaling : bool


func _ready() -> void:
	initialize_scales()
	is_scaling = false


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ScaleUp"):
		try_set_scale(current_scale.id + 1)

	if Input.is_action_just_pressed("ScaleDown"):
		try_set_scale(current_scale.id - 1)


func _physics_process(delta: float) -> void:
	if player_root.scale.distance_to(target_player_scale) < 0.1 and\
	camera.zoom.distance_to(target_camera_zoom) < 0.1:
		t = 0.0
		is_scaling = false
		return

	is_scaling = true
	if scale_speed == 0:
		t = 1
	else:
		t += delta * scale_speed

	player_root.scale = player_root.scale.lerp(target_player_scale, t)
	camera.zoom = camera.zoom.lerp(target_camera_zoom, t)


func initialize_scales() -> void:
	var scales_arr : Array[Node] = get_children()
	for scale_set : ScaleSettings in scales_arr:
		scales[scale_set.id] = scale_set
	
	try_set_scale(default_scale.id)
	

func try_set_scale(new_scale_id : int) -> bool:
	if scales.has(new_scale_id) == false or is_scaling:
		return false

	var new_scale : ScaleSettings = scales[new_scale_id]
	current_scale = new_scale
	target_camera_zoom = Vector2(new_scale.camera_zoom, new_scale.camera_zoom)
	target_player_scale = Vector2(new_scale.player_scale, new_scale.player_scale)
	player_movement.speed_scale = new_scale.move_speed
	player_movement.jump_scale = new_scale.jump_strength
	player_movement.gravity_scale = new_scale.gravity_scale
	return true
