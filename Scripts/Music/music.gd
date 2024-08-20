extends Node2D


func _ready() -> void:
	GlobalMusic.play_music_level()
	GlobalMusic.change_volume(-10)
