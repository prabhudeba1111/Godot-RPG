class_name Map
extends TileMapLayer

enum Directions {North, East, West, South}

@export var default_player_start_position :Vector2i
@export var step_inrcement: float = 1.0


var player


func _ready() -> void:
	CommandDispatcher.player_move.connect(_on_player_move)
	
	if get_node("Entities") == null:
		printerr("No entities layer in map")

func _on_player_move(direction) -> void:
	var newPos = Vector2(player.position)
	var moveIncrement = tile_set.tile_size.x * step_inrcement
	
	match direction:
		Directions.North:
			newPos.y -= moveIncrement
		Directions.East:
			newPos.x += moveIncrement
		Directions.West:
			newPos.x -= moveIncrement
		Directions.South:
			newPos.y += moveIncrement
	
	if player_can_move_to(newPos):
		player.position = newPos
		player.update_animation(direction)


func player_can_move_to(pos :Vector2) -> bool:
	return false


func spawn_player_at_position(pos, facing):
	var spawn_position :Vector2i
	if pos:
		spawn_position = pos
	else:
		spawn_position = default_player_start_position
	
	player.position = Vector2(spawn_position.x + 16, spawn_position.y + 16)
