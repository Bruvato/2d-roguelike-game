extends Area2D

const BULLET = preload("res://scenes/bullet/bullet.tscn")

@export var fire_rate: float = 5
@onready var fire_cooldown: float = 1 / fire_rate

@export var mag_size: int = 10
@onready var current_ammo: int = mag_size

@export var reload_time: float = 1

@export var recoil_force: float = 10

var _fired: bool = false
var _reloading:bool = false


func _process(delta):
	if Input.is_action_pressed("fire"):
		if (!_fired and !_reloading):
			shoot()
			Signals.emit_signal("shake", 0.5)
			_fired = true
			%"Fire Cooldown".start(fire_cooldown)
			
			current_ammo -= 1
			#print_debug(current_ammo)
			if current_ammo <= 0:
				_reloading = true
				#print_debug("relaoding")
				%"Reload".start(reload_time)


func shoot():
	var new_bullet = BULLET.instantiate()
	new_bullet.global_transform = %"Shooting Point".global_transform
	#%"Shooting Point".add_child(new_bullet)
	get_node("/root/Game/Projectiles").add_child(new_bullet)
	
	get_parent().velocity = new_bullet.global_position.direction_to(global_position) * recoil_force


func _on_fire_cooldown_timeout():
	_fired = false


func _on_reload_timeout():
	_reloading = false
	current_ammo = mag_size
