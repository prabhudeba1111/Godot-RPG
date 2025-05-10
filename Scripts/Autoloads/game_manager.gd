extends Node

var defaultMapPath :String = "res://Scenes/GameScreen/Maps/world_map.tscn"
var currentMapPath

func start_newgame() -> void:
	currentMapPath = defaultMapPath
