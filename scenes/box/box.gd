class_name Box
extends StaticBody2D

@onready var health_component: HealthComponent = $"Health Component"

@onready var hurtbox_component: HurtBoxComponent = $"Hurtbox Component"

@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var flash_component: FlashComponent = $FlashComponent

@onready var spawner_component: SpawnerComponent = $SpawnerComponent

@onready var effects: Node = $"/root/Game/Effects"

func _ready() -> void:
	hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):
		flash_component.flash()
		scale_component.tween_scale()
		)
	health_component.no_health.connect(func(): 
		Signals.change_time_scale.emit(0.1, 0.5)
		spawner_component.call_deferred("spawn", global_position, global_rotation, effects)
		)
