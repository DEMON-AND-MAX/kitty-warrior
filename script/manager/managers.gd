extends Node

@onready var asset_preload_manager = $AssetPreloadManager

@export var level: String

func get_level() -> String:
	return level
