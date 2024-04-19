extends Line2D
class_name Trails

var trail_points_queue : Array
@export var MAX_TRAIL_LENGTH : int

func _process(_delta):
	var pos = _get_position()
	
	trail_points_queue.push_front(pos)
	
	if trail_points_queue.size() > MAX_TRAIL_LENGTH:
		trail_points_queue.pop_back()
	
	clear_points()
	
	for point in trail_points_queue:
		add_point(point)

func _get_position():
	return get_global_mouse_position()
