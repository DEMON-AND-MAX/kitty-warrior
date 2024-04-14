extends Node
# generally use this for level-specific assets (music, tiles, enemies, etc)
# tldr: this class is used for pseudo-dynamic preloading

@export var managers: Node

const dictionaries: PackedStringArray = [
	"music_layer", "music_track"
]

var level: String
var file: FileAccess
var line: PackedStringArray
var asset_dictionary: Dictionary

func _ready():
	level = owner.get_level()
	asset_dictionary = load_assets(level)

func load_assets(path: String) -> Dictionary:
	var return_dict: Dictionary
	file = FileAccess.open("res://asset/level_data/" + path + ".txt", FileAccess.READ)
	line = file.get_csv_line()
	
	while !file.eof_reached():
		# check if dictionary name found
		if Functions.array_in_array(dictionaries, line):
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
	return return_dict

func get_level() -> String:
	return level

func get_dictionary_category(category: String) -> Dictionary:
	return asset_dictionary[category]

func get_dictionary() -> Dictionary:
	return asset_dictionary
