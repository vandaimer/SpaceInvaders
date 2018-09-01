extends Node2D

var pre_enemie_shot = preload("res://scenes/EnemieShot.tscn")

var dir = 1
const squad_translate_to_right_left = Vector2(6, 0)
const squad_translate_to_down = Vector2(0, 8)


func _ready():
	get_node("TimerShot").start()

func shoot():
	var enemiesCount =  get_node("Enemies").get_child_count()
	var enemie = get_node("Enemies").get_child(randi() % enemiesCount)
	var enemie_shot = pre_enemie_shot.instance()
	get_parent().add_child(enemie_shot)
	enemie_shot.global_position = enemie.global_position

func _on_TimerShot_timeout():
	get_node("TimerShot").wait_time = rand_range(0.5, 3)
	shoot()

func _on_TimerMove_timeout():
	var to_down = false

	for enemie in get_node("Enemies").get_children():
		enemie.next_frame()
		if enemie.global_position.x > 170 and dir > 0:
			dir = -1
			to_down = true

		if enemie.global_position.x < 10 and dir < 0:
			dir = 1
			to_down = true

	if to_down:
		translate(squad_translate_to_down)
	else:
		translate(squad_translate_to_right_left * dir)