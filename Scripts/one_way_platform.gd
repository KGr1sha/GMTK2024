class_name OneWayPlatform
extends Node2D


var shape : CollisionShape2D
var player_detector : Area2D
var player_on_platfrom : bool


func _ready() -> void:
	shape = get_node("CollisionShape2D")
	player_detector = get_node("PlayerDetector")

	player_detector.body_entered.connect(on_enter)
	player_detector.body_exited.connect(on_exit)
	shape.one_way_collision = true
	player_on_platfrom = false


func _process(_delta: float) -> void:
	if player_on_platfrom and Input.is_action_just_pressed("Drop"):
		drop()


func on_enter(_other : Node2D) -> void:
	player_on_platfrom = true


func on_exit(_other : Node2D) -> void:
	player_on_platfrom = false


func drop() -> void:
	shape.disabled = true
	get_tree().create_timer(0.1).timeout.connect(func(): shape.disabled = false)
