extends Node

signal process_command(command)
signal wait_for_command
signal pause_processor

signal player_move(direction)

signal display_message(message)
signal display_command_prompt
signal display_clear

signal load_map(newMapPath, spawnPoint, facing)
signal load_complete
