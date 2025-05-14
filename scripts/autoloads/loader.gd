extends Node

signal loading_progress(percentage)

@export var loadingScene :Node = preload("res://scenes/ui/loading_screen.tscn").instantiate()

var scenePath

func load_scene(caller, path) -> void:
	scenePath = path
	get_tree().root.add_child(loadingScene)
	ResourceLoader.load_threaded_request(scenePath)
	caller.queue_free()

func _process(_delta: float) -> void:
	if scenePath:
		var progress :Array[float] = []
		var loaderStatus = ResourceLoader.load_threaded_get_status(scenePath, progress)
		
		loading_progress.emit(progress[0])
		
		if loaderStatus == ResourceLoader.THREAD_LOAD_LOADED:
			var loadedScene = ResourceLoader.load_threaded_get(scenePath).instantiate()
			
			get_tree().root.remove_child(loadingScene)
			get_tree().root.add_child(loadedScene)
			
			scenePath = null
