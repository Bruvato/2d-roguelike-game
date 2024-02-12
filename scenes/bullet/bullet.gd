extends Area2D

@export var speed: float = 1000

@export var attack_damage: float = 1.0
@export var knockback_force: float = 10.0

func _physics_process(delta):
	var direction: Vector2 = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta


func _on_body_entered(body: Node2D):
	
	queue_free()
	
	#Signals.emit_signal("bullet_collided", global_position, body.global_position.direction_to(global_position))

func _on_area_entered(area):
	if area is HurtBoxComponent:
		var attack = Attack.new(attack_damage, knockback_force, global_position)
		area.take_damage(attack)