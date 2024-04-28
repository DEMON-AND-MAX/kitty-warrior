extends TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	# Load the texture
	var texture = load("...asset//tilemap//FieldsTile_01.png")
	
	# Create a TileSet and add the texture to it
	var tile_set = TileSet.new()
	var tile_data = TileSet.new()
	tile_data.texture = texture
	tile_set.tiles_autotile_insert(0, tile_data)
	

	
	# Set the tile set of the TileMap to the created TileSet
	set_tileset(tile_set)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
