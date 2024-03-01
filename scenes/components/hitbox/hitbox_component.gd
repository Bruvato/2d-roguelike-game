class_name HitboxComponent
extends Area2D

@export var damage: int = 1

@export var knockback_force: float = 100

signal hit_hurtbox(hurtbox: HurtBoxComponent)

func _on_area_entered(area: Area2D) -> void:
	if not area is HurtBoxComponent: return

	if area.is_invincible: return
	
	hit_hurtbox.emit(area)

	area.hurt.emit(self)

#@export var attack_damage: float = 1.0
#@export var knockback_force: float
#@export var piercing: bool
#
#@export var area_attack: bool
#
#@export var attack_rate: float
#@onready var attack_cooldown: float = 1 / attack_rate
#@export var died_signal: String
#
#var attacked: bool = false
#
#
#func _physics_process(delta):
	#if not area_attack or attacked:
		#return
	#
	#var overlapping_areas = get_overlapping_areas()
	#if overlapping_areas.size() > 0:
		#for area in overlapping_areas:
			#attack(area)
		#attacked = true
		#$Timer.start(attack_cooldown)
			#
	#if not piercing:
		#die()
#
#
#func _on_area_entered(area: Area2D):
	#if area_attack or attacked:
		#return
	#
	#attack(area)
	#
	#if not piercing:
		#die(area)
	##attacked = true
	##$Timer.start(attack_cooldown)
	#
#func _on_area_exited(area):
	#pass # Replace with function body.
#
#func attack(area: Area2D):
	#if not area is HurtBoxComponent:
		#return
	#
	#var attack = Attack.new(attack_damage, knockback_force, global_position)
	#area.take_damage(attack)
	#
#
#func die(area: Area2D = null):
	#get_parent().queue_free()
	#
	#if area == null or died_signal.is_empty():
		#return
	#
	#Signals.emit_signal(died_signal, global_position, area.global_position.direction_to(global_position))
#
#
#func _on_timer_timeout():
	#attacked = false


