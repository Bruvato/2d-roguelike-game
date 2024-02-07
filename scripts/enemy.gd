extends CharacterBody2D

@export var health = 3

@export var speed: float = 50
@export var accel: float = 5

@onready var player: CharacterBody2D = get_parent().get_child(0)

@onready var sprite: Sprite2D = get_child(0)
@onready var color: Color = sprite.modulate

const DEATH_PARTICLE = preload("res://scenes/explosion_particle.tscn")

func _physics_process(delta):

	var direction: Vector2 = position.direction_to(player.global_position)
	
	velocity.x = move_toward(velocity.x, direction.x * speed, accel)
	velocity.y = move_toward(velocity.y, direction.y * speed, accel)
	
	move_and_slide()
	look_at(player.global_position)

func take_damage():
	health -= 1
	sprite.modulate = Color.WHITE
	%Timer.start()
	
	if health <= 0:
		die()

func die():
	
	queue_free()

func _on_timer_timeout():
	sprite.modulate = color
	
