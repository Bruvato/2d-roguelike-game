extends Node2D

var time_scale: float = 1


func _ready() -> void:
	Signals.change_time_scale.connect(func(scale: float, duration: float):
		Engine.time_scale = scale
		await get_tree().create_timer(duration, true, false, true).timeout
		Engine.time_scale = 1
		)
