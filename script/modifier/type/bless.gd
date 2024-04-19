class_name Bless
extends Modifier

func _ready():
	_bless()

func _bless() -> void:
	for node in get_children():
		node.use()

func clear() -> void:
	for node in get_children():
		if node.multiplier == 0:
			node.multiplier = 1
		else:
			node.multiplier *= -1
		node.use()
	queue_free()
