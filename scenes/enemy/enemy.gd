extends CharacterBody2D

@export var speed: float = 50
@export var accel: float = 5

@onready var player: CharacterBody2D = get_node("/root/Game/Player")

func _physics_process(delta):

	var direction: Vector2 = position.direction_to(player.global_position)
	
	velocity.x = move_toward(velocity.x, direction.x * speed, accel)
	velocity.y = move_toward(velocity.y, direction.y * speed, accel)
	
	move_and_slide()
	look_at(player.global_position)



