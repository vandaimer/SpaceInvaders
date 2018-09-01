extends Area2D

const VELOCITY = 250
var direction = Vector2(0, -1)

func _ready():
	add_to_group("shot")
	set_process(true)

func _process(delta):
	translate(direction * VELOCITY * delta)

	if global_position.y < 0:
		queue_free()

func _on_Shot_area_entered(area):
	if area.has_method("destroy"):
		area.destroy(self)
		destroy()

func destroy():
	queue_free()