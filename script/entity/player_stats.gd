class_name PlayerStats
extends Node

enum STAT_TYPE {
	HEALTH, ABSORPTION,
	DAMAGE,
	SPEED, STAMINA,
}

const WORLD_SPEED: float = 300

@export var MAX_STATS: StatsThing
@export var MIN_STATS: StatsThing
@export var MOVE_STATS: MoveStats

@export var stat_caps: StatsThing
@export var stats: StatsThing

func get_stat(stat: STAT_TYPE, b_is_cap: bool = false):
	match stat:
		STAT_TYPE.HEALTH:
			return stats.health
		STAT_TYPE.ABSORPTION:
			return stats.absorption
		STAT_TYPE.DAMAGE:
			return stats.damage
		STAT_TYPE.SPEED:
			return stats.speed
		STAT_TYPE.STAMINA:
			return stats.stamina
	return null

func get_stat_range(stat: STAT_TYPE, b_is_min: bool = false):
	var stat_max
	var stat_min
	match stat:
		STAT_TYPE.HEALTH:
			stat_max = MAX_STATS.health
			stat_min = MIN_STATS.health
		STAT_TYPE.ABSORPTION:
			stat_max = MAX_STATS.absorption
		STAT_TYPE.DAMAGE:
			stat_max = MAX_STATS.damage
		STAT_TYPE.SPEED:
			stat_max = MAX_STATS.speed
		STAT_TYPE.STAMINA:
			stat_max = MAX_STATS.stamina
	return [stat_min, stat_max]

func set_stat(stat: STAT_TYPE, value, b_is_cap: bool = false) -> void:
	var edit = get_stat(STAT_TYPE, b_is_cap)
	edit += value
