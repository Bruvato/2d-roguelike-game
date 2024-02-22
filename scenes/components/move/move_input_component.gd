extends Node

@export var character_move_component: CharacterMoveComponent

func _input(event: InputEvent) -> void:
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	character_move_component.velocity = direction
