extends Node

@export var entities : Node

var map

func _ready() -> void:
	CommandDispatcher.load_map.connect(load_map)


func load_map(newMapPath :String, spawnPoint, facing) -> void:
	CommandDispatcher.pause_processor.emit()
	
	if map:
		map.queue_free()
	
	map = load(newMapPath).instantiate()
	
	add_child(map)
	entities.add_child(map.spawn_player_at_position(spawnPoint, facing))
	
	GameManager.currentMapPath = newMapPath
	CommandDispatcher.wait_for_command.emit()
