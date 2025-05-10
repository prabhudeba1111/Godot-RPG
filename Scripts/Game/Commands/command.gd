class_name Command

signal command_processed(label)

var commandLabel :String

func execute():
	command_processed.emit(commandLabel)

func get_command_text() -> String:
	return commandLabel
