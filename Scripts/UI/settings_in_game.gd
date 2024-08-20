class_name Settings
extends Control


@export var master_slider : HSlider
@export var music_slider : HSlider
@export var sfx_slider : HSlider
var master_bus_name : String = "Master"
var music_bus_name: String = "Music"
var sfx_bus_name: String = "SFX"
var master_bus : int
var music_bus : int
var sfx_bus : int


func _ready() -> void:
	master_bus = AudioServer.get_bus_index(master_bus_name)
	music_bus = AudioServer.get_bus_index(music_bus_name)
	sfx_bus = AudioServer.get_bus_index(sfx_bus_name)

	master_slider.value = get_bus_volume(master_bus)
	music_slider.value = get_bus_volume(music_bus)
	sfx_slider.value = get_bus_volume(sfx_bus)

	master_slider.value_changed.connect(change_master)
	music_slider.value_changed.connect(change_music)
	sfx_slider.value_changed.connect(change_sfx)


func change_master(value : float) -> void:
	change_bus_volume(master_bus, value)


func change_music(value : float) -> void:
	change_bus_volume(music_bus, value)


func change_sfx(value : float) -> void:
	change_bus_volume(sfx_bus, value)


func change_bus_volume(bus : int, volume : float) -> void:
	AudioServer.set_bus_volume_db(bus, linear_to_db(volume))


func get_bus_volume(bus : int) -> float:
	return db_to_linear(AudioServer.get_bus_volume_db(bus))
