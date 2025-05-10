class_name PassCommand
extends Command


func _init() -> void:
	commandLabel = "pass"


func execute() -> void:
	print("Player passed.")
	command_processed.emit(commandLabel)
