class_name HealthComponent
extends Node2D


@export var MAX_HEALTH: float
var current_health: float

@export var sprite: Sprite2D
var color: Color

@export var damaged_signal: String
@export var died_signal: String

@onready var health_bar: TextureProgressBar = $"Health Bar Component/Progress Bar"

@onready var flash_component: FlashComponent = $"../FlashComponent"


func _ready():
	current_health = MAX_HEALTH
	
	health_bar.visible = false
	health_bar.max_value = MAX_HEALTH

func _process(delta):
	$"Health Bar Component".set_rotation(-global_rotation)

func take_damage(attack: Attack):
	current_health -= attack.attack_damage
	
	update_health_bar()
	
	if (get_parent() is CharacterBody2D):
		get_parent().velocity = attack.attack_position.direction_to(global_position) * attack.knockback_force
	
	#add I FRAMES
	flash_component.flash()

	
	if current_health <= 0:
		get_parent().queue_free()
		if died_signal:
			Signals.emit_signal(died_signal, global_position, attack.attack_position.direction_to(global_position))
	
	elif damaged_signal:
		Signals.emit_signal(damaged_signal, global_position, attack.attack_position.direction_to(global_position))

func update_health_bar():
	health_bar.visible = true
	health_bar.value = current_health
