class_name GameScreen
extends Node

@export var map :Node


func _ready() -> void:
	map.add_child(load(GameManager.currentMapPath).instantiate())


func _on_pass_button_pressed() -> void:
	CommandDispatcher.process_command.emit(PassCommand.new())
