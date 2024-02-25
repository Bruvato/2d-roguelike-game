class_name ScaleComponent
extends Node

@export var sprite: Node2D

var initial_scale: Vector2
@export var scale_amount: Vector2 = Vector2(1.5, 1.5)

@export var scale_duration_in: float = 0.04
@export var scale_duration_out: float = 0.36

signal scaled

func _ready() -> void:
	initial_scale = sprite.scale

func tween_scale() -> void:
	var tween = create_tween().set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	
	tween.tween_property(sprite, "scale", scale_amount, scale_duration_in).from_current()
	
	tween.tween_property(sprite, "scale", initial_scale, scale_duration_out).from(scale_amount)
	
	scaled.emit()
