class_name HealthBarComponent
extends Node2D

@export var health_component: HealthComponent
@export var health_bar: TextureProgressBar

func _ready() -> void:
	visible = false
	health_bar.max_value = health_component.health
	health_component.healthed_changed.connect(func(health: int): 
		visible = true
		health_bar.value = health
		)

func _physics_process(delta: float) -> void:
	rotation = -get_parent().global_rotation
