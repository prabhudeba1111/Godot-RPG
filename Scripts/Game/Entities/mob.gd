class_name Mob
extends Node2D

@export var collisionRay_1 :  RayCast2D
@export var collisionRay_2 :  RayCast2D

func update_raycasts(destination) -> void:
	var direction = destination - position
	
	if direction.x:
		collisionRay_1.position = Vector2(8, 1)
		collisionRay_2.position = Vector2(8, 15)
	if direction.y:
		collisionRay_1.position = Vector2(1, 8)
		collisionRay_2.position = Vector2(15, 8)
	if direction.x < 0:
		collisionRay_1.position.x -= 1
		collisionRay_2.position.x -= 1
	if direction.y < 0:
		collisionRay_1.position.y -= 1
		collisionRay_2.position.y -= 1
	
	collisionRay_1.target_position = Vector2(direction)
	collisionRay_1.force_raycast_update()
	collisionRay_2.target_position = Vector2(direction)
	collisionRay_2.force_raycast_update()
