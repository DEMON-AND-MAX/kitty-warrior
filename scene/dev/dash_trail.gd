extends Trails
 
func _ready():
	#print("is dashing trail")
	Signals.is_dashing_signal.connect(_visible)
 
func _get_position():
	return get_parent().position
	
func _visible(on: bool) -> void:
	#print("dash setting visible " + str(on))
	self.visible = on
