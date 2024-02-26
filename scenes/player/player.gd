class_name Player
extends CharacterBody2D

@export var speed: float = 50
@export var accel: float = 5

@onready var hurtbox_component: HurtBoxComponent = $HurtboxComponent

@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var flash_component: FlashComponent = $FlashComponent
@onready var shake_component: ShakeComponent = $ShakeComponent

@onready var gun: Gun = $Gun


func _ready() -> void:
	hurtbox_component.hurt.connect(func(hitbox_component: HitboxComponent):
		Signals.change_time_scale.emit(0.1, 0.1)
		flash_component.flash()
		scale_component.tween_scale()
		shake_component.tween_shake()
		)
	gun.fired.connect(func():
		scale_component.tween_scale()
		Signals.emit_signal("shake", 0.5)
		)
		

func _process(delta: float) -> void:
	if Input.is_action_pressed("fire"):
		gun.shoot()

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")

	velocity.x = move_toward(velocity.x, direction.x * speed, accel)
	velocity.y = move_toward(velocity.y, direction.y * speed, accel)

	move_and_slide()
	look_at(get_global_mouse_position())

