extends Line2D
class_name Zap

var timer: Timer

var trail_points_queue : Array
@export var MAX_TRAIL_LENGTH : int

func _get_position():
	return player.position

@export var MAX_ZAP_TRAIL_LENGTH: int
var zap_trail_points_queue: Array
var player: Player
var player_pos: Vector2
var player_direction: Vector2

func _ready():
	timer = Timer.new()
	timer.wait_time = 0.1
	timer.timeout.connect(_new_position)
	add_child(timer)
	timer.start()
	
	player = Functions.get_player_node();
	
	
func _new_position():
	if player.is_zapping:
		player.curr_stamina_capacity -= 0.1
		var player_direction = player.position.direction_to(get_global_mouse_position())
		#var mult = Vector2(cos(player_direction), sin(player_direction))
		player.position.x += player_direction.x * 100 + randi_range(-100, 100)
		player.position.y += player_direction.y * 100 + randi_range(-100, 100)

		
	
