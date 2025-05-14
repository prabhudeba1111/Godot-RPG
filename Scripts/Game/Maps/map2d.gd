class_name Map2d
extends Map

func _ready() -> void:
	print(get_terrain_data_for_tile(0, "TerrainType", 6, 6))
	
	super._ready()


func get_terrain_data_for_tile(layer, data, x, y):
	var tile :TileData = get_cell_tile_data(Vector2i(x, y))
	
	if tile:
		return tile.get_custom_data(data)
	else:
		return null


func spawn_player_at_position(pos, facing):
	player = load("res://Scenes/Game/Entities/player.tscn").instantiate()
	
	super.spawn_player_at_position(pos, facing)
	
	return player
