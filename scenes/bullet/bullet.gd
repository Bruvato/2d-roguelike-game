class_name Bullet
extends Area2D


@export var life_time: float
@onready var move_component: MoveComponent = $MoveComponent

@onready var flash_component: FlashComponent = $FlashComponent

var normal: Vector2


func _ready():
	flash_component.flash()
	
	$Timer.start(life_time)

func _physics_process(delta):
	if $RayCast2D.is_colliding():
		normal = $RayCast2D.get_collision_normal().normalized()



func _on_timer_timeout():
	die()

func _on_body_entered(body: Node2D):
	if body is Enemy:
		return
	if $RayCast2D.is_colliding():
		if normal.length() == 0:
			normal = $RayCast2D.get_collision_normal().normalized()
		#direction = direction.bounce(normal)
		#rotation = direction.angle()

	die()

func die(body: Node2D = null):
	queue_free()
	Signals.emit_signal("bullet_collided", global_position, normal)
