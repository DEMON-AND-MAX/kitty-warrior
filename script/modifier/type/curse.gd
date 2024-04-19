class_name Curse
extends Modifier

@export var time: float

var timer: Timer

func _ready():
	var timer = Timer.new()
	timer.wait_time = time
	timer.one_shot = true
	timer.timeout.connect(clear)
	_curse()

func _curse() -> void:
	for node in get_children():
		node.use()
	
	if time > 0:
		timer.start()

func clear() -> void:
	for node in get_children():
		if node.multiplier == 0:
			node.multiplier = 1
		else:
			node.multiplier *= -1
		node.use()
	queue_free()
