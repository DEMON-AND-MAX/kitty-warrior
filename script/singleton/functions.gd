extends Node

func load_csv(path: String, dictionaries: Array) -> Dictionary:
	var return_dict: Dictionary
	var file = FileAccess.open("res://asset/" + path + ".txt", FileAccess.READ)
	var line = file.get_csv_line()
	
	while !file.eof_reached():
		# check if dictionary name found
		if array_in_array(dictionaries, line):
			var temp_dict: Dictionary
			return_dict[line[0]] = temp_dict
			line = file.get_csv_line()
			
			# parse lines under specific category
			while !Functions.array_in_array(dictionaries, line) and !line[0] == "":
				var temp_list: PackedStringArray
				var b_ignore: bool = true
				
				# parse each word in line and append to the value
				for word in line:
					if !b_ignore:
						temp_list.append(word)
					else:
						b_ignore = false
				temp_dict[line[0]] = temp_list
				line = file.get_csv_line()
	file.close()
	return return_dict

func array_in_array(find : Array, in_array : Array) -> bool:
	for value in find:
		if value in in_array:
			return true
	return false

func get_player_node() -> Player:
	return get_tree().get_nodes_in_group("player")[0]

func get_managers_node() -> Node:
	return get_tree().get_nodes_in_group("manager")[0]
