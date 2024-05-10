class_name Mod
extends Usable

@export var stat: String = ""
@export var multiplier: float = 1
@export var value: float = 0

var player_node: Player

func _ready():
	player_node = Functions.get_player_node()

func use() -> void:
	pass
