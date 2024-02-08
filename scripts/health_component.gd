class_name HealthComponent
extends Node2D


@export var MAX_HEALTH: float
var health: float

@export var sprite: Sprite2D
var color: Color

func _ready():
	health = MAX_HEALTH

func take_damage(attack: Attack):
	health -= attack.attack_damage
	get_parent().velocity = attack.attack_position.direction_to(global_position) * attack.knockback_force
	
	color = sprite.modulate
	sprite.modulate = Color.WHITE
	%Timer.start()
	
	if health <= 0:
		get_parent().queue_free()


func _on_timeout():
	sprite.modulate = color
