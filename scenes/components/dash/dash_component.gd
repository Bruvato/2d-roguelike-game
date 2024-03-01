class_name DashComponent
extends Node

@export var character_body: CharacterBody2D

@export var dash_speed: float
@export var dash_time: float

@export var invincibility_component: InvincibilityComponent

var initial_speed: float

func dash():
	initial_speed = character_body.speed
	character_body.speed = dash_speed
	invincibility_component.set_invincibility(true)
	
	await get_tree().create_timer(dash_time).timeout
	
	character_body.speed = initial_speed
	invincibility_component.set_invincibility(false)
	
