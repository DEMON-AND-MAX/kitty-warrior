extends Trails
 
func _ready():
	#print("is zapping trail")
	Signals.is_zapping_signal.connect(_visible)
 
func _get_position():
	return get_parent().position
	
func _visible(on: bool) -> void:
	
	#print("zap setting visible " + str(on))
	self.visible = on
