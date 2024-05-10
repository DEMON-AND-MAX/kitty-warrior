extends Camera2D

#var spd = 10
#var radius_required_to_move = 100
#
#func _process(delta):
	#var mouse_position = get_global_mouse_position()
	#var mouse_delta = mouse_position - global_position
	#var max_radius = get_parent().position * 1.5
	#if mouse_delta.length() >= radius_required_to_move and position <= max_radius:
		#position += (mouse_delta / radius_required_to_move) * spd * delta
