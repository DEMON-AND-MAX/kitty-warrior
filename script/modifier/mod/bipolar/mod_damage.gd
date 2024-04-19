extends Mod

@export var damage: float

func use() -> void:
	damage = damage * multiplier
	#player_node.update_damage(damage)
