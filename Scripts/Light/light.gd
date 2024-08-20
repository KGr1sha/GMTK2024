extends PointLight2D

@export var frames : Array[CompressedTexture2D]
@export var wait_time : float = 0.2
@export var auto_start : bool = false
var index : int = 0

func _ready() -> void:
	texture = ImageTexture.new()
	if auto_start:
		$Timer.start(wait_time)
	
	texture.set_image(frames[0].get_image())

func _on_timer_timeout() -> void:
	index = (index + 1) % len(frames) 
	texture.set_image(frames[index].get_image())
