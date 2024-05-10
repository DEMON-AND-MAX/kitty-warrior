extends Node

var modifier: Node

func _ready():
	print(generate_modifier("perish", {
		"1": ["bipolar_mod", "damage", 10, 1],
		"2": ["unipolar_mod" ,"health", 10, 1, 1]
	}))

func generate_modifier(path: String, modifier_dict: Dictionary):
	modifier = load("res://scene/modifier/" + path + ".tscn").instantiate()
	
	for value in modifier_dict:
		var mod = Node.new()
		mod.set_script(load("res://script/modifier/mod/" + modifier_dict[value][0] + ".gd"))
		modifier.add_child(mod)
		
		mod.stat = modifier_dict[value][1]
		mod.value = modifier_dict[value][2]
		mod.multiplier = modifier_dict[value][3]
		
		match modifier_dict[value][0]:
			"unipolar_mod":
				mod.polarity = modifier_dict[value][4]
	
	return modifier
