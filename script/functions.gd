extends Node

func array_in_array(find : Array, in_array : Array) -> bool:
	for value in find:
		if value in in_array:
			return true
	return false

func get_player_node() -> Player:
	return get_tree().get_nodes_in_group("player")[0]
