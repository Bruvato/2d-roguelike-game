class_name AttackComponent
extends Area2D

@export var attack_damage: float = 1.0
@export var knockback_force: float
@export var attack_rate: float
@onready var attack_cooldown: float = 1 / attack_rate

var attacked: bool = false


func _physics_process(delta):
	var overlapping_areas = get_overlapping_areas()
	if overlapping_areas.size() > 0:
		for area in overlapping_areas:
			attack(area)
		
	if attack_rate == 0:
		get_parent().queue_free()
			
			

func _on_area_entered(area):
	pass
	#attack(area)


func attack(area: Area2D):
	if area is HurtBoxComponent and !attacked:
		var attack = Attack.new(attack_damage, knockback_force, global_position)
		area.take_damage(attack)
		

			
		
		$Timer.start(attack_cooldown)
		attacked = true


func _on_timer_timeout():
	attacked = false
