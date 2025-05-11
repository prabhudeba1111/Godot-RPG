class_name GameScreen
extends Node

@export var map :Node


func _ready() -> void:
	CommandDispatcher.load_map.emit(GameManager.defaultMapPath, null, Map.Directions.North)
	CommandDispatcher.wait_for_command.emit()


func _on_pass_button_pressed() -> void:
	CommandDispatcher.process_command.emit(PassCommand.new())
