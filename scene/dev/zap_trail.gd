extends Trails
 
func _ready():
	Signals.is_zapping_signal.connect(_visible)
 
func _get_position():
	return get_parent().position
	
func _visible(on: bool) -> void:
	self.visible = on
