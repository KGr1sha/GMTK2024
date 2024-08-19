class_name RunAnim
extends State


var animated_sprite : AnimatedSprite2D
@export var player_root : Node2D
var horizontal_input : float


func _ready() -> void:
	animated_sprite = get_node("../../AnimatedSprite2D")


func enter() -> void:
	animated_sprite.play("run")


func process(_delta: float) -> void:
	horizontal_input = Input.get_axis("MoveLeft", "MoveRight")

	if horizontal_input == 0.0:
		fsm.change_state("Idle")
	else:
		animated_sprite.scale = Vector2(
			abs(animated_sprite.scale.x) * horizontal_input,
			animated_sprite.scale.y
		)
