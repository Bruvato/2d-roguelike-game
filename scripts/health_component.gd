class_name HealthComponent
extends Node2D


@export var MAX_HEALTH: float
var health: float

@export var sprite: Sprite2D
var color: Color

@export var particle_component: ParticleComponent

func _ready():
	health = MAX_HEALTH

func take_damage(attack: Attack):
	health -= attack.attack_damage
	
	if (get_parent() is CharacterBody2D):
		get_parent().velocity = attack.attack_position.direction_to(global_position) * attack.knockback_force
	
	color = sprite.modulate
	sprite.modulate = Color.WHITE
	%Timer.start()
	
	if health <= 0:
		die()

func die():
	get_parent().queue_free()
	particle_component.spawn_particle(global_position)

func _on_timeout():
	sprite.modulate = color
