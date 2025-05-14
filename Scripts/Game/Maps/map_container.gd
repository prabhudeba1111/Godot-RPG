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

func _unhandled_key_input(_event: InputEvent) -> void:
	var direction = null
	
	if Input.is_action_pressed("ui_up"):
		direction = Map.Directions.North
	if Input.is_action_pressed("ui_left"):
		direction = Map.Directions.West
	if Input.is_action_pressed("ui_right"):
		direction = Map.Directions.East
	if Input.is_action_pressed("ui_down"):
		direction = Map.Directions.South
	
	if direction != null:
		CommandDispatcher.process_command.emit(MoveCommand.new(direction))
