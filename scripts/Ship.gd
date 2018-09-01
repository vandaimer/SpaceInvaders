extends Area2D

const VELOCITY = 100

var prev_shot = preload("res://scenes/Shot.tscn")

var left
var right
var to_right = 0
var lazer
var prev_lazer = false

func _ready():
	set_process(true)
	pass

func _process(delta):
	to_right = 0

	right = Input.is_action_pressed("ui_right")
	left = Input.is_action_pressed("ui_left")
	lazer = Input.is_action_pressed("disparo")

	if right:
		to_right += 1

	if left:
		to_right -= 1

	translate(Vector2(1, 0) * VELOCITY * to_right * delta)

	if global_position.x < 7:
		global_position.x = 7

	if global_position.x > 173:
		global_position.x = 173

	if lazer and not prev_lazer and get_tree().get_nodes_in_group("shot").size() == 0:
		var shot = prev_shot.instance()
		get_parent().add_child(shot)
		shot.global_position = Vector2(global_position)

	prev_lazer = lazer