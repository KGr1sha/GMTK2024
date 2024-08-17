class_name KeyLock
extends Lock
#lock that uses key


var can_open : bool


func _ready() -> void:
	var area : Area2D = get_node("Area2D")
	area.body_entered.connect(_on_enter)
	area.body_exited.connect(_on_exit)


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Interact")\
	and can_open:
		unlock()


func _on_enter(other : Node2D) -> void:
	var collecter : KeyCollecter = other.get_node("KeyCollecter")
	if collecter.current_keys > 0:
		can_open = true


func _on_exit(_other : Node2D) -> void:
	can_open = false
