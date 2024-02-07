extends Area2D

@export var speed: float = 1000

const EXPLOSION_PARTICLE = preload("res://scenes/explosion_particle.tscn")


func _physics_process(delta):
	var direction: Vector2 = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta


func _on_body_entered(body):
	spawn_explosion()
	
	queue_free()
	
	if body.has_method("take_damage"):
		body.take_damage()

func spawn_explosion():
	var explosion = EXPLOSION_PARTICLE.instantiate()
	explosion.global_position = global_position
	explosion.emitting = true
	get_tree().current_scene.add_child(explosion)

