extends Node

func array_in_array(find : Array, in_array : Array) -> bool:
	for value in find:
		if value in in_array:
			return true
	return false
