extends Mod

@export var health: float

func use() -> void:
	health = -health * multiplier
	if health < 0:
		#player_node.update_health(health)
		pass
