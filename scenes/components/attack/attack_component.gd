class_name AttackComponent
extends Area2D

@export var attack_damage: float = 1.0
@export var knockback_force: float
@export var piercing: bool

@export var attack_rate: float
@onready var attack_cooldown: float = 1 / attack_rate
@export var died_signal: String

var attacked: bool = false


#func _physics_process(delta):
	#if one_shot:
		#return
	#
	#var overlapping_areas = get_overlapping_areas()
	#if overlapping_areas.size() > 0:
		#for area in overlapping_areas:
			#attack(area)


func _on_area_entered(area):
	attack(area)
	
func _on_area_exited(area):
	pass # Replace with function body.

func attack(area: Area2D):
	if area is HurtBoxComponent and !attacked:
		var attack = Attack.new(attack_damage, knockback_force, global_position)
		area.take_damage(attack)
		
		#attacked = true
		#
		if not piercing:
			die(area)
		#
		#$Timer.start(attack_cooldown)

func die(area: Area2D = null):
	get_parent().queue_free()
	
	if area != null or died_signal != null:
		Signals.emit_signal(died_signal, global_position, area.global_position.direction_to(global_position))


func _on_timer_timeout():
	attacked = false
