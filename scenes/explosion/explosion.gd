extends Area2D

@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var hitbox_component: HitboxComponent = $"Hitbox Component"
@onready var destroy_component: DestroyComponent = $DestroyComponent

func _ready() -> void:
	scale_component.scaled.connect(func():
		print_debug("delted")
		#destroy_component.destroy()
		)
		
	#hitbox_component.scale = Vector2.ZERO
	scale_component.tween_scale()
	pass
	
