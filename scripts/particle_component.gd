class_name ParticleComponent
extends Node2D


const EXPLOSION_PARTICLE = preload("res://scenes/explosion_particle.tscn")

func spawn_particle(spawn_position: Vector2):
	var explosion = EXPLOSION_PARTICLE.instantiate()
	explosion.global_position = spawn_position
	explosion.emitting = true
	get_tree().current_scene.add_child(explosion)
