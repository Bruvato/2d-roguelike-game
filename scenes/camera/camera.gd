extends Camera2D

@export var shake_strength: float
@export var shake_fade: float

var shake_amount: float = 0



func _ready():
	Signals.connect("shake", func(amount): shake_amount = amount)



func _process(delta):
	if  shake_amount > 0:
		shake_amount = lerpf(shake_amount, 0, shake_fade * delta)
		
		offset = Vector2(randf_range(-shake_amount * shake_strength, shake_amount * shake_strength), randf_range(-shake_amount * shake_strength, shake_amount * shake_strength))
