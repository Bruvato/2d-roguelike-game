class_name InvincibilityComponent
extends Node

@export var hurtbox_component: HurtBoxComponent

@export var sprite: Sprite2D
@onready var flash_component = $FlashComponent

func set_invincibility(value: bool):
	hurtbox_component.is_invincible = value

func start_invincibility_timer(time: float):
	set_invincibility(true)
	
	start_blinking()
	await get_tree().create_timer(time).timeout
	
	set_invincibility(false)
	
func start_blinking():
	flash_component.flash()
	
	await get_tree().create_timer(2 * flash_component.flash_duration).timeout
	
	if hurtbox_component.is_invincible:
		start_blinking()

	
