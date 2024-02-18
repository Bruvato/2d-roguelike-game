extends Area2D

@export var speed: float = 1000

@export var life_time: float


func _ready():
	$Timer.start(life_time)

func _physics_process(delta):
	var direction: Vector2 = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta


func _on_timer_timeout():
	queue_free()
	Signals.emit_signal("bullet_collided", global_position, global_position)
