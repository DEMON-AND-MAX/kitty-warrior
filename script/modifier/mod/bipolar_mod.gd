class_name BipolarMod
extends Mod

"""
BIPOLAR MOD
- value will be applied and unapplied after use, after unapplying it will remove itself
- if multiplier is 0, it will be ignored on use and applied after use with multiplier = 1
"""

var b_is_reversed: bool = false

func use() -> void:
	value = value * multiplier
	player_node.update_stat(stat, value)
	
	if b_is_reversed:
		queue_free()
	
	if multiplier == 0:
		multiplier = 1
		b_is_reversed = true
	elif multiplier != 0:
		multiplier *= -1
		b_is_reversed = true
