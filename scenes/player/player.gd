extends CharacterBody2D

@onready var character_move_component: CharacterMoveComponent = $CharacterMoveComponent

func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())

func _input(event: InputEvent) -> void:
	character_move_component.velocity = Input.get_vector("left", "right", "up", "down")
