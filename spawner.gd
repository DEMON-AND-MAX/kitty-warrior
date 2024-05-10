class_name Spawner
extends Marker2D

var timer: Timer
var enemy_amount: int

var stage_data: Array

@export var enemy_instance: PackedScene

var enemy

func _ready():
	timer = Timer.new()
	timer.autostart = false
	timer.timeout.connect(_spawn)
	add_child(timer)

func set_data(data: Array) -> void:
	stage_data = data
	
	#set spawner enemy from enemy catalogue
	enemy = enemy_instance
	
	enemy_amount = int(stage_data[1])
	
	timer.wait_time = float(stage_data[2])
	timer.start()

func _spawn() -> void:
	if get_child_count() >= enemy_amount:
		timer.stop()
		return
	
	add_child(enemy.instantiate())
