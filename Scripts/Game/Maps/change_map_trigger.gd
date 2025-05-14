class_name ChangeMapTrigger
extends MapEntity

@export_file() var map
@export var spawnPoint :Vector2i
@export var facing : Map.Directions


func execute(target):
	CommandDispatcher.load_map.emit(map, spawnPoint, facing)
