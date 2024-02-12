class_name HealthComponent
extends Node2D


@export var MAX_HEALTH: float
var health: float

@export var sprite: Sprite2D
var color: Color

@export var damaged_signal: String
@export var died_signal: String

func _ready():
	health = MAX_HEALTH

func take_damage(attack: Attack):
	health -= attack.attack_damage
	
	if (get_parent() is CharacterBody2D):
		get_parent().velocity = attack.attack_position.direction_to(global_position) * attack.knockback_force
	
	#add I FRAMES
	color = sprite.modulate
	sprite.modulate = Color.WHITE
	%Timer.start()
	
	if health <= 0:
		get_parent().queue_free()
		if died_signal:
			Signals.emit_signal(died_signal, global_position, attack.attack_position.direction_to(global_position))
	
	if damaged_signal:
		Signals.emit_signal(damaged_signal, global_position, attack.attack_position.direction_to(global_position))


func _on_timeout():
	sprite.modulate = color
