extends Mod

@export var health: float

func use() -> void:
	health = health * multiplier
	#player_node.update_health(health)
