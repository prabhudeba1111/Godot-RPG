class_name LoadingPanel
extends MarginContainer

@export var player :Player


func _ready() -> void:
	CommandDispatcher.load_map.connect(_load_map)
	CommandDispatcher.load_complete.connect(_load_complete)
	
	player.camera.enabled = false
	player.animator.sprite_frames.set_animation_loop("walk_down", true)


func _load_map(map, spawnPoint, facing) -> void:
	player.animator.play("walk_down")
	show()

func _load_complete() -> void:
	player.animator.stop()
	hide()
