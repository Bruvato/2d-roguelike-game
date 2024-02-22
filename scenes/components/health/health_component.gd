class_name HealthComponent
extends Node

@export var health: int = 1:
	set(value):
		health = value
		
		healthed_changed.emit()
		
		if health <= 0:
			no_health.emit()

signal healthed_changed()
signal no_health()

	#if (get_parent() is CharacterBody2D):
		#get_parent().velocity = attack.attack_position.direction_to(global_position) * attack.knockback_force

	#add I FRAMES
	#flash_component.flash()
	
#func update_health_bar():
	#health_bar.visible = true
	#health_bar.value = current_health
