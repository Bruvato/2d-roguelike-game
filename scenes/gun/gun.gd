class_name Gun
extends Area2D

@export var body: CharacterBody2D
@export var spawner_component: SpawnerComponent

@onready var shooting_point: Marker2D = %"ShootingPoint"

@onready var scale_component: ScaleComponent = $ScaleComponent

@export var fire_rate: float = 5
@onready var fire_cooldown: float = 1 / fire_rate

@export var mag_size: int = 10
@onready var current_ammo: int = mag_size

@export var reload_time: float = 1

@export var recoil_force: float = 100

@onready var projectiles: Node = $"/root/Game/Projectiles"

signal fired

var _fired: bool = false
var _reloading:bool = false


func _ready() -> void:
	pass

func shoot():
	if (!_fired and !_reloading):
	
		scale_component.tween_scale()
		
		var new_bullet: Bullet = spawner_component.spawn(shooting_point.global_position, shooting_point.global_rotation, projectiles)
		new_bullet.move_component.velocity = Vector2.RIGHT.rotated(global_rotation)
		
		body.velocity = global_position.direction_to(%"ShootingPoint".global_position) * recoil_force

		_fired = true
		fired.emit()
		%"Fire Cooldown".start(fire_cooldown)
		
		current_ammo -= 1
		#print_debug(current_ammo)
		if current_ammo <= 0:
			_reloading = true
			#print_debug("relaoding")
			%"Reload".start(reload_time)

func _on_fire_cooldown_timeout():
	_fired = false


func _on_reload_timeout():
	_reloading = false
	current_ammo = mag_size
