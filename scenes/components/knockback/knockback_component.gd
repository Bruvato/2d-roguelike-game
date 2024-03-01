class_name KnockbackComponent
extends Node

@export var knockback_force: float = 100

@export var body: CharacterBody2D
@export var hurtbox_component: HurtBoxComponent

func _ready() -> void:
	hurtbox_component.hurt.connect(func(hitbox: HitboxComponent):

		body.velocity = hitbox.global_position.direction_to(hurtbox_component.global_position) * hitbox.knockback_force
		)
