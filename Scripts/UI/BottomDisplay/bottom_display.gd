extends MarginContainer

@export var scroll_container :ScrollContainer
@export var messages :VBoxContainer
@export var messageHistory :int= 10

var messageLinePreload = preload("res://Scenes/UI/message_line.tscn")


func  _ready() -> void:
	CommandDispatcher.display_message.connect(_on_message_received)
	CommandDispatcher.display_command_prompt.connect(_display_command_prompt)
	CommandDispatcher.display_clear.connect(_clear_window)


func _on_command(text: String) -> void:
	display_command(text)


func _on_message_received(message) -> void:
	display_message(message)


func _display_command_prompt() -> void:
	messages.add_child(messageLinePreload.instantiate())


func _clear_window() -> void:
	for item in messages.get_children():
		item.queue_free()


func display_message(message :String) -> void:
	var messageLine = messageLinePreload.instantiate()
	messageLine.text = "%s\n" % message
	messages.add_child(messageLine)
	scroll_to_end()


func display_command(text :String ) -> void:
	if messages.get_child_count() == 0:
		_display_command_prompt()
	
	var currentMessageLine :RichTextLabel = messages.get_children()[messages.get_child_count() - 1]
	currentMessageLine.text = currentMessageLine.text.insert(currentMessageLine.text.length() - 2, text)
	
	scroll_to_end()


func scroll_to_end() -> void:
	await scroll_container.get_v_scroll_bar().changed
	
	if messages.get_child_count() > messageHistory:
		messages.get_child(0).queue_free()
	
	scroll_container.scroll_vertical = scroll_container.get_v_scroll_bar().max_value
