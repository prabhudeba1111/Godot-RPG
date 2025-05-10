class_name PassCommand
extends Command


func _init() -> void:
	commandLabel = "pass"


func execute() -> void:
	command_processed.emit(commandLabel)
