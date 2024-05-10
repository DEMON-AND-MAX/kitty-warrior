class_name StatBase
extends Stat

@export var min: float
@export var max: float

func update(val: float) -> void:
	clampf(stat + val, min, max)
