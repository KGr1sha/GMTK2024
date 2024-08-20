class_name MainMenu
extends Control

@export var level_to_load : PackedScene


func _ready() -> void:
	$SettingsMenu.hide()
	GlobalMusic.play_music_level()


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_packed(level_to_load)


func _on_settings_button_pressed() -> void:
	$SettingsMenu.show()
	$StartMenu.hide()


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_back_button_pressed() -> void:
	$StartMenu.show()
	$SettingsMenu.hide()


func _on_h_slider_value_changed(value: float) -> void:
	GlobalMusic.change_volume(value)
