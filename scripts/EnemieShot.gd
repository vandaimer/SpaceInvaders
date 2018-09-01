extends Area2D

const vel = 120
const dir = Vector2(0, 1)

func _ready():
	set_process(true)

func _process(delta):
	translate(dir * vel * delta)
	if global_position.y > 270:
		destroy(self)

func destroy(obj):
	queue_free()