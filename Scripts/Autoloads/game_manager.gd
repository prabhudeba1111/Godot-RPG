extends Node

var defaultMapPath :String = "res://Scenes/Game/Maps/world_map.tscn"
var currentMapPath

func start_newgame() -> void:
	currentMapPath = defaultMapPath
