extends Node

export var score = 0
export var lives = 5
var timer

func _ready():
	get_tree().paused = true
	timer = get_node("Timer")
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.start()

func _on_Timer_timeout():
	get_tree().paused = false

func increase_score(s):
	score += int(s)
	find_node("Score").update_score()
 
func decrease_lives():
	lives -= 1
	find_node("Lives").update_lives()
	if lives <= 0:
		get_tree().change_scene("res://Scenes/End.tscn")
		