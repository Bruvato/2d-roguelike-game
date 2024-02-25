class_name HealthComponent
extends Node

@export var health: int = 1:
	set(value):
		health = value
		
		healthed_changed.emit(health)
		
		if health <= 0:
			no_health.emit()

signal healthed_changed(health: int)
signal no_health()



	#add I FRAMES
	#flash_component.flash()
	
#func update_health_bar():
	#health_bar.visible = true
	#health_bar.value = current_health
