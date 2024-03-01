class_name FlashComponent
extends Node

#const FLASH_MATERIAL = preload("res://effects/white_flash_material.tres")
@export var flash_material: Material

@export var sprite: CanvasItem

@export var flash_duration: = 0.1

var original_sprite_material: Material


func _ready() -> void:
	original_sprite_material = sprite.material

func flash():
	sprite.material = flash_material
	
	await get_tree().create_timer(flash_duration).timeout
	
	sprite.material = original_sprite_material
	
