class_name InvincibilityComponent
extends Node

@export var hurtbox_component: HurtBoxComponent

@export var sprite: Sprite2D

func set_invincibility(value: bool):
	hurtbox_component.is_invincible = value

func start_invincibility_timer(time: float):
	set_invincibility(true)
	
	await get_tree().create_timer(time).timeout
	
	set_invincibility(false)
	
	
