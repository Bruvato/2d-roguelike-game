class_name Enemy
extends CharacterBody2D


@onready var character_move_component: CharacterMoveComponent = $CharacterMoveComponent

@onready var player: CharacterBody2D = get_node("/root/Game/Player")

func _physics_process(delta):
	character_move_component.velocity = position.direction_to(player.global_position)
	
	look_at(player.global_position)



