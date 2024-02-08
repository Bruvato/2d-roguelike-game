class_name Attack
extends Node

var attack_damage: float
var knockback_force: float
var attack_position: Vector2

func _init(ad: float = 0, kf: float = 0, ap: Vector2 = Vector2.ZERO):
	attack_damage = ad
	knockback_force = kf
	attack_position = ap
