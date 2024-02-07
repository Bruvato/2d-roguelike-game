extends Area2D

const BULLET = preload("res://scenes/bullet.tscn")

@export var fire_cooldown: float = 0.1

var _fired: bool = false

func _ready():
	%Timer.wait_time = fire_cooldown

func _process(delta):
	if Input.is_action_pressed("fire"):
		if (!_fired):
			shoot()
			_fired = true
			%Timer.start()
		
	#if Input.is_action_just_pressed("fire"):
		#shoot()


func shoot():
	var new_bullet = BULLET.instantiate()
	new_bullet.global_transform = %"Shooting Point".global_transform
	%"Shooting Point".add_child(new_bullet)


func _on_timer_timeout():
	_fired = false