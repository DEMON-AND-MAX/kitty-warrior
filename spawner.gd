class_name Spawner
extends Marker2D
const ITEM_TEST = preload("res://scene/item_test.tscn")
var timer: Timer
var enemy_amount: int

var stage_data: Array

var enemy

func _ready():
	timer = Timer.new()
	timer.autostart = false
	timer.timeout.connect(_spawn)
	add_child(timer)

func set_data(data: Array) -> void:
	stage_data = data
	
	#set spawner enemy from enemy catalogue
	enemy = ITEM_TEST
	
	enemy_amount = int(stage_data[1])
	
	timer.wait_time = float(stage_data[2])
	timer.start()

func _spawn() -> void:
	if get_child_count() >= enemy_amount:
		timer.stop()
		return
	
	add_child(ITEM_TEST.instantiate())
