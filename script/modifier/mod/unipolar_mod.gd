class_name UnipolarMod
extends Mod

"""
UNIPOLAR MOD
- value will be applied on use once and instantly deleted
- value is only applied if polarity matches the value 
eg. if polarity is positive, value has to be positive and vice versa
"""

@export var polarity: int = 1

func use() -> void:
	if value * polarity > 0:
		player_node.update_stat(stat, value * multiplier)
	queue_free()
