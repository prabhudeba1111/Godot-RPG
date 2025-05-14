class_name MapEntity
extends Area2D


func execute(target) -> void:
	print(target.name)


func _on_area_entered(area: Area2D) -> void:
	execute(area.get_parent())
