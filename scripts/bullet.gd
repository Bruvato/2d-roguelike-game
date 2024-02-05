extends Area2D

@export var speed = 1000


func _physics_process(delta):
	var direction: Vector2 = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
