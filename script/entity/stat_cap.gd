class_name StatCapped
extends StatBase

@export var cap: float

func update_cap(val: float) -> void:
	clamp(cap + val, min, max)
	if stat > cap:
		stat = cap
