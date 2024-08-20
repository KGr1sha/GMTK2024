class_name Lock
extends Node2D
#base class for all locks


signal unlocked
var opened : bool = false


func unlock() -> void:
	opened = true
	unlocked.emit()


func lock() -> void:
	opened = false
	unlocked.emit()
