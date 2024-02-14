extends Area2D

@export var speed: float = 1000

@export var damage: float = 1.0
@export var knockback_force: float
@export var life_time: float

func _ready():
	$Timer.start(life_time)

func _physics_process(delta):
	var direction: Vector2 = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta


func _on_body_entered(body: Node2D):
	pass

func _on_area_entered(area):
	if area is HurtBoxComponent:
		var attack = Attack.new(damage, knockback_force, global_position)
		area.take_damage(attack)
		
		queue_free()
		Signals.emit_signal("bullet_collided", global_position, area.global_position.direction_to(global_position))

func _on_timer_timeout():
	queue_free()
	Signals.emit_signal("bullet_collided", global_position, global_position)
