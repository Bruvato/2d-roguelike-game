class_name AttackComponent
extends Area2D

@export var attack_damage: float = 1.0
@export var knockback_force: float = 10.0

func _on_area_entered(area):
	if area is HurtBoxComponent:
		var attack = Attack.new(attack_damage, knockback_force, global_position)
		#area.take_damage(attack)
		print_debug("hit")
