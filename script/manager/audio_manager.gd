extends Node

@onready var asset_preload_manager = $"../AssetPreloadManager"

#enum _music_state {SILENT, MUSIC_LAYER, MUSIC_TRACK}

const _category_list = [
	"music_layer", "music_track"
]

const _ignore_list = [
	"track", "layer"
]

var asset_dict: Dictionary
var currently_playing: AudioStreamPlayer

func _ready():
	# preload sounds for current level here
	_preload()
	
	# connect to signals
	Signals.play_sound.connect(_play_sound)
	Signals.play_music_layer.connect(_play_music_layer)
	Signals.play_music_track.connect(_play_music_track)

func _preload() -> void:
	asset_dict = asset_preload_manager.get_dictionary()
	
	for dict in asset_dict.keys():
		if dict not in _category_list:
			asset_dict.erase(dict)
			continue
		
		for key in asset_dict[dict].keys():
			if key in _ignore_list:
				asset_dict[dict].erase(key)
				continue
			
			var audio_player = AudioStreamPlayer.new()
			audio_player.stream = load("res://asset/audio/" + dict + "/" + asset_dict[dict][key][1] + ".ogg")
			
			add_child(audio_player)
			asset_dict[dict][key] = audio_player

func _play_sound(sound: String) -> void:
	pass

func _play_music_layer(layer: String) -> void:
	if currently_playing:
		currently_playing.stop()
	currently_playing = _find_audio_player("music_layer", layer)
	currently_playing.play()

func _play_music_track(track: String) -> void:
	if currently_playing:
		currently_playing.stop()
	currently_playing = _find_audio_player("music_track", track)
	currently_playing.play()

func _find_audio_player(category: String, key: String) -> AudioStreamPlayer:
	return asset_dict[category].get(key)
