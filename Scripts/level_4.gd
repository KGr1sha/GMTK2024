extends Node2D


func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if $Interactive/Door.is_opened == true:
		$Layers/Label.show()
