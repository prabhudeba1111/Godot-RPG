extends Node

var map : Map
var loading : bool
var newSpawnPoint
var newFacing

func _ready() -> void:
	CommandDispatcher.load_map.connect(load_map)


func load_map(newMapPath :String, spawnPoint, facing) -> void:
	CommandDispatcher.pause_processor.emit()
	
	if map:
		map.queue_free()
	
	loading = true
	
	GameManager.currentMapPath = newMapPath
	
	ResourceLoader.load_threaded_request(GameManager.currentMapPath)
	
	newFacing = facing
	newSpawnPoint = spawnPoint


func _process(delta: float) -> void:
	if loading:
		if ResourceLoader.load_threaded_get_status(GameManager.currentMapPath) == ResourceLoader.THREAD_LOAD_LOADED:
			
			
			map = ResourceLoader.load_threaded_get(GameManager.currentMapPath).instantiate()
			call_deferred("add_child", map)
			
			map.spawn_player_at_position(newSpawnPoint, newFacing)
			loading = false
			CommandDispatcher.load_complete.emit()
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
