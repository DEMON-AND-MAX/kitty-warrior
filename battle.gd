class_name Battle
extends Node2D

@onready var spawner_marker = $SpawnerMarker
@onready var check_enemies = $CheckEnemies

@export var path: String

var stages: Array = [
	"nr"
]

var spawner_marker_list: Array
var stages_nr: int
var stage: int = 1
var battle_data: Dictionary
var max_enemies = 3

func _ready():
	check_enemies.timeout.connect(_check_enemies)
	spawner_marker_list = spawner_marker.get_children()
	
	var file = FileAccess.open("res://asset/" + path + ".txt", FileAccess.READ)
	var line = file.get_csv_line()
	stages_nr = int(file.get_csv_line()[0])
	file.close()
	
	for i in stages_nr:
		stages.append("lvl" + str(i + 1))
	
	battle_data = Functions.load_csv(path, stages)
	
	#for spawner in battle_data[stages[stage]]:
		#var spawner_node = spawner_marker_list.filter(
			#func(marker): return marker.name == spawner
		#)
		#spawner_node.add_child(ITEM_TEST.instantiate())
		#
		#print(battle_data[stages[stage]][spawner])
	
	_level(stage)

func _level(stage: int) -> void:
	for spawner in battle_data[stages[stage]]:
		var spawner_node = spawner_marker_list.filter(
			func(marker): return marker.name == spawner
		)
		
		spawner_node[0].set_data(battle_data[stages[stage]][spawner])

func _check_enemies():
	var enemies = 0
	
	for spawner in spawner_marker_list:
		enemies += spawner.get_child_count()
	
	if enemies <= max_enemies and stage < stages_nr:
		stage += 1
		_level(stage)
