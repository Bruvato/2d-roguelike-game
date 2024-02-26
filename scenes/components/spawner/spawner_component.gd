class_name SpawnerComponent
extends Node2D

@export var scene: PackedScene

func spawn(spawn_position: Vector2 = global_position, spawn_rotation: float = 0, parent: Node = get_tree().current_scene) -> Node:
	var instance = scene.instantiate()
	
	parent.add_child(instance)

	instance.global_position = spawn_position
	instance.global_rotation = spawn_rotation
	
	return instance
