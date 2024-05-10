class_name Potion
extends Modifier

@export var time: float

var timer: Timer

func _ready():
	var timer = Timer.new()
	timer.wait_time = time
	timer.one_shot = true
	timer.timeout.connect(_clear)
	_potion()

func _potion() -> void:
	for node in get_children():
		node.use()

func _clear() -> void:
	for node in get_children():
		node.multiplier *= -1
		node.use()
	queue_free()
