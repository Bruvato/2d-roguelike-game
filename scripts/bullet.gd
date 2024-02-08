extends Area2D

@export var speed: float = 1000

@export var attack_damage: float = 1.0
@export var knockback_force: float = 10.0

const EXPLOSION_PARTICLE = preload("res://scenes/explosion_particle.tscn")


func _physics_process(delta):
	var direction: Vector2 = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta


func _on_body_entered(body):
	spawn_explosion()
	
	queue_free()
	#AOE explosion?

func _on_area_entered(area):
	if area is HurtBoxComponent:
		var attack = Attack.new(attack_damage, knockback_force, global_position)
		area.take_damage(attack)


func spawn_explosion():
	var explosion = EXPLOSION_PARTICLE.instantiate()
	explosion.global_position = global_position
	explosion.emitting = true
	get_tree().current_scene.add_child(explosion)
