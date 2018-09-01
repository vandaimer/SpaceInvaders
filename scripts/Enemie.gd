tool
extends Area2D

export (int, "A", "B", "C") var tipo = 0 setget set_tipo

var score = 0
var frame = 0

var attrs = [
	{
		texture = preload("res://Assets/sprites/InvaderA_sheet.png"),
		score = 10
	},
	{
		texture = preload("res://Assets/sprites/InvaderB_sheet.png"),
		score = 20
	},
	{
		texture = preload("res://Assets/sprites/InvaderC_sheet.png"),
		score = 30
	},
]

func _ready():
	pass

func _draw():
	get_node("Sprite").texture = attrs[tipo].texture
	score = attrs[tipo].score

func set_tipo(val):
	tipo = val
	if is_inside_tree():
		update()
	
func destroy(obj):
	queue_free()

func next_frame():
	if frame == 0:
		frame = 1
	else:
		frame = 0
	get_node("Sprite").set_frame(frame)
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass