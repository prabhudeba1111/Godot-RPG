class_name GameScreen
extends Node

@export var map :Node


func _ready() -> void:
	map.add_child(load(GameManager.currentMapPath).instantiate())
