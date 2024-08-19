extends PointLight2D

@export var frames : Array[CompressedTexture2D]
var index : int = 0

func _ready() -> void:
	texture.set_image(frames[0].get_image())

func _on_timer_timeout() -> void:
	index = (index + 1) % len(frames) 
	texture.set_image(frames[index].get_image())
