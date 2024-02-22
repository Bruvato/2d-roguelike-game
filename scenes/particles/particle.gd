extends GPUParticles2D


func _ready() -> void:
	emitting = true

func _on_finished():
	queue_free()
