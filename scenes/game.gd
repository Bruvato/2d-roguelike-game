extends Node2D

const BULLET_COLLIDE_PARTICLE = preload("res://scenes/particles/bullet_collide_particle.tscn")
const EXPLOSION_PARTICLE = preload("res://scenes/particles/explosion_particle.tscn")
const ENEMY_DEATH_PARTICLE = preload("res://scenes/particles/enemy_death_particle.tscn")


func _ready():
	Signals.connect("bullet_collided", 
	func(spawn_position, direction): 
		spawn_particle(BULLET_COLLIDE_PARTICLE, spawn_position, direction))
	
	Signals.connect("box_died", 
	func(spawn_position, direction):
		spawn_particle(EXPLOSION_PARTICLE, spawn_position, direction))
	
	Signals.connect("enemy_died", 
	func(spawn_position, direction): 
		spawn_particle(ENEMY_DEATH_PARTICLE, spawn_position, direction))

func spawn_particle(particle: Resource, spawn_position: Vector2, direction: Vector2):
	var new_particle = particle.instantiate()
	new_particle.global_position = spawn_position
	new_particle.global_rotation = direction.angle()
	new_particle.emitting = true
	#get_tree().current_scene.add_child(new_particle)
	%Particles.add_child(new_particle)
