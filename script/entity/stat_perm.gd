class_name StatPerm
extends Stat

func update(val: float) -> void:
	print("WARNING: Trying to update an immutable stat.")
	#assert(false, "Trying to update an immutable stat.")
