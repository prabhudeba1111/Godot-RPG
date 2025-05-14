class_name WorldMap
extends Map2d


func player_can_move_to(pos : Vector2) -> bool:
	var tilesize = tile_set.tile_size.x
	var cast_cell_1
	var cast_cell_2
	
	player.update_raycasts(pos)
	
	cast_cell_1 = local_to_map(pos + player.collisionRay_1.position)
	cast_cell_2 = local_to_map(pos + player.collisionRay_2.position)
	
	if (get_terrain_data_for_tile(0, "TerrainType", cast_cell_1.x, cast_cell_1.y) != "Ocean" and 
		get_terrain_data_for_tile(0, "TerrainType", cast_cell_2.x, cast_cell_2.y) != "Ocean"):
		return true
	else:
		CommandDispatcher.display_message.emit("Your Path is Blocked.\n")
		return false
