extends CharacterBody2D

@export var speed: float = 100
@export var accel: float = 10

func _physics_process(delta):
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	
	velocity.x = move_toward(velocity.x, direction.x * speed, accel)
	velocity.y = move_toward(velocity.y, direction.y * speed, accel)
	
	#velocity = direction * speed
	
	move_and_slide()
	look_at(get_global_mouse_position())
