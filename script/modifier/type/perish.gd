class_name Perish
extends Modifier

func _ready():
	_perish()

func _perish() -> void:
	for node in get_children():
		node.use()
	queue_free()
