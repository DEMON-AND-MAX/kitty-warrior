extends Node

@onready var asset_preload_manager = $AssetPreloadManager

@export var level: String

func get_level() -> String:
	return level

func _ready():
	Signals.play_music_track.emit("shop")
