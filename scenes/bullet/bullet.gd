class_name Bullet
extends Area2D


@export var life_time: float
@onready var move_component: MoveComponent = $MoveComponent

@onready var hitbox_component: HitboxComponent = $HitboxComponent

@onready var destroy_component: DestroyComponent = $DestroyComponent


func _ready():
	hitbox_component.hit_hurtbox.connect(destroy_component.destroy.unbind(1))
	$Timer.start(life_time)


func _on_timer_timeout():
	destroy_component.destroy()

func _on_body_entered(body: Node2D):
	if body is CharacterBody2D:
		return

	destroy_component.destroy()

