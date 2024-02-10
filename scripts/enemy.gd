extends CharacterBody2D

@export var speed: float = 50
@export var accel: float = 5

@onready var player: CharacterBody2D = get_parent().get_child(0)

const DEATH_PARTICLE: Resource = preload("res://scenes/explosion_particle.tscn")

func _physics_process(delta):

	var direction: Vector2 = position.direction_to(player.global_position)
	
	velocity.x = move_toward(velocity.x, direction.x * speed, accel)
	velocity.y = move_toward(velocity.y, direction.y * speed, accel)
	
	move_and_slide()
	look_at(player.global_position)
	
	var particel = DEATH_PARTICLE.instantiate()




