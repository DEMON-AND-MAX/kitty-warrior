extends Node

"""
ASSET PRELOAD MANAGER
- generally use this for level-specific assets (music, tiles, enemies, etc.) that need to be dynamically preloaded
"""

@export var managers: Node

const dictionaries: PackedStringArray = [
	"music_layer", "music_track"
]

var level: String
var asset_dictionary: Dictionary

func _ready():
	level = owner.get_level()
	asset_dictionary = Functions.load_csv("level_data/" + level, dictionaries)

func get_level() -> String:
	return level

func get_dictionary_category(category: String) -> Dictionary:
	return asset_dictionary[category]

func get_dictionary() -> Dictionary:
	return asset_dictionary
