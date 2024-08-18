class_name ClimbAnim
extends State


@export var animated_sprite : AnimatedSprite2D
var body : CharacterBody2D
var vertical_input : float


func _ready() -> void:
	body = get_node("../..")


func enter() -> void:
	animated_sprite.play("climb")


func process(_delta: float) -> void:
	if Input.get_axis("MoveLeft", "MoveRight")\
	or Input.is_action_just_pressed("Jump")\
	or body.is_on_floor():
		fsm.change_state("Run")
	
	vertical_input = Input.get_axis("Climb", "Drop")
	if vertical_input == 0:
		pause()
	else:
		play()


func pause():
	if animated_sprite.is_playing():
		animated_sprite.pause()


func play():
	if not animated_sprite.is_playing():
		if vertical_input > 0:
			animated_sprite.play()
		else:
			animated_sprite.play_backwards()
