class_name Stat
extends Resource

@export var title: String
@export var stat: float

func update(val: float) -> void:
	stat = stat + val
