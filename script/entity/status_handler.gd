class_name StatusHandler
extends Resource

@export var stat_list: Array[Stat]

func update(title: String, value: float, b_cap: bool = false):
	for stat in stat_list:
		if stat.title != title:
			continue
		if b_cap:
			stat.update_cap(value)
		else:
			stat.update(value)
