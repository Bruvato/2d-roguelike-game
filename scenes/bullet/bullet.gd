extends Area2D

@export var speed: float = 1000


func _physics_process(delta):
	var direction: Vector2 = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta


func _on_body_entered(body: Node2D):
	
	queue_free()
	
	Signals.emit_signal("bullet_collided", global_position, body.global_position.direction_to(global_position))
