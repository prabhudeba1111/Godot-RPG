class_name MoveCommand
extends Command

var direction

func _init(dir) -> void:
	commandLabel = "move"
	direction = dir

func execute() -> void:
	CommandDispatcher.player_move
