extends Area2D

@export var speed: float = 1000

@export var attack_damage: float = 1.0
@export var knockback_force: float = 10.0

@export var particle_component: ParticleComponent


func _physics_process(delta):
	var direction: Vector2 = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta


func _on_body_entered(body):
	
	queue_free()
	#AOE explosion?
	
	particle_component.spawn_particle(global_position)

func _on_area_entered(area):
	if area is HurtBoxComponent:
		var attack = Attack.new(attack_damage, knockback_force, global_position)
		area.take_damage(attack)
