class_name MainMenu
extends Control


@export var level_to_load : PackedScene
@export var play_button : Button
@export var settings_button : Button
@export var quit_button : Button


func load_level() -> void:
	get_tree().change_scene_to_packed(level_to_load)


func open_settings() -> void:
	pass


func quit() -> void:
	pass
