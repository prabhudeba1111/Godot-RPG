extends Control


func _on_new_game_button_pressed() -> void:
	GameManager.start_newgame()
	Loader.load_scene(self, "res://Scenes/Game/game_screen.tscn")
