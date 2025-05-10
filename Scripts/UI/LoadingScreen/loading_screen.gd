extends Control

@export var loadingBar :TextureProgressBar


func _ready() -> void:
	Loader.loading_progress.connect(_on_progress_updated)

func _on_progress_updated(percentage : float) -> void:
	loadingBar.value = percentage * 100
