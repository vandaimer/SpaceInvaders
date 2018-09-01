extends Node2D

var pre_enemie_shot = preload("res://scenes/EnemieShot.tscn")

var dir = 1
const squad_translate_vector = Vector2(6, 0)

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
	if global_position.x == 36:
		dir = -1

	if global_position.x == -30:
		dir = 1

	translate(squad_translate_vector * dir)