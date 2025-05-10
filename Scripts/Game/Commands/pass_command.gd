class_name PassCommand
extends Command


func _init() -> void:
	commandLabel = "Pass"


func execute() -> void:
	command_processed.emit(commandLabel)
