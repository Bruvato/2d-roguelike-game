class_name HurtBoxComponent
extends Area2D

signal hurt(hitbox: HitboxComponent)

	
#@export var health_component: HealthComponent
#
#func take_damage(attack: Attack):
	#if health_component:
		#health_component.take_damage(attack)
