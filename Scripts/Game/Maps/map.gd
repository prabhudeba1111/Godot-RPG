class_name Map
extends TileMapLayer

enum Directions {North, East, West, South}

@export var default_player_start_position :Vector2i

var player

func spawn_player_at_position(position, facing):
	var spawn_position :Vector2i
	if position:
		spawn_position = position
	else:
		spawn_position = default_player_start_position
	
	player.position = Vector2(spawn_position.x + 16, spawn_position.y + 16)
