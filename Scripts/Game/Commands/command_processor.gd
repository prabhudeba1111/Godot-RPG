extends Timer

signal broadcast_command(label)

var resumeWaiting :bool= true


func _ready() -> void:
	CommandDispatcher.process_command.connect(_process_command)
	CommandDispatcher.wait_for_command.connect(_wait_for_command)
	CommandDispatcher.pause_processor.connect(_pause_processor)


func _process_command(command :Command):
	if is_stopped():
		return
	stop()
	
	command.command_processed.connect(_command_processed)
	broadcast_command.emit(command.get_command_text())
	command.execute()


func _wait_for_command():
	resumeWaiting = true
	start()
	CommandDispatcher.display_command_prompt.emit()


func _pause_processor():
	stop()
	resumeWaiting = false


func _command_processed(result):
	if result:
		print(result)
		
	if resumeWaiting:
		_wait_for_command()


func _on_timeout() -> void:
	_process_command(PassCommand.new())
