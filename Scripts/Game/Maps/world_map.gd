class_name WorldMap
extends Map2d


func player_can_move_to(position : Vector2) -> bool:
	var tilesize = tile_set.tile_size.x
	var cast_cell_1
	var cast_cell_2
	
	player.update_raycasts(position)
	
	cast_cell_1 = local_to_map(position + player.raycast_1.position)
	cast_cell_2 = local_to_map(position + player.raycast_2.position)
	
	if get_terrain_data_for_tile(0, "TerrainType", cast_cell_1.x, cast_cell_1.x) and get_terrain_data_for_tile(0, "TerrainType", cast_cell_1.x, cast_cell_1.x):
		return true
	else:
		return false
