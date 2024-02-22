class_name CharacterMoveComponent
extends Node

@export var character: CharacterBody2D

@export var speed: float
@export var velocity: Vector2
@export var acceleration: float


func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	
	character.velocity.x = move_toward(character.velocity.x, velocity.x * speed, acceleration)
	character.velocity.y = move_toward(character.velocity.y, velocity.y * speed, acceleration)
	
	character.move_and_slide()
