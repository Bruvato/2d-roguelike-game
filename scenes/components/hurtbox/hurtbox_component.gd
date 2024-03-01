class_name HurtBoxComponent
extends Area2D

signal hurt(hitbox: HitboxComponent)

@export var is_invincible: bool = false:
	set(value):
		is_invincible = value
		
		for child in get_children():
			if not child is CollisionShape2D and not child is CollisionPolygon2D: 
				continue
			child.set_deferred("disabled", value)
