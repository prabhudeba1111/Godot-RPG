class_name MoveCommand
extends Command

var direction

func _init(dir) -> void:
	commandLabel = "Move"
	direction = dir

func execute() -> void:
	CommandDispatcher.player_move.emit(direction)
	command_processed.emit()

func get_direction() -> String:
	return Map.Directions.keys()[direction]

func get_command_text() -> String:
	return "%s %s" % [commandLabel, get_direction()]
