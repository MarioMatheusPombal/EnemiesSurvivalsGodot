extends Node2D

var pontuacao = "Pontuacao: "
var score = 0


func _ready():
	%Pontos.set_text('0')
	spawn_mob()
	spawn_mob()
	spawn_mob()
	spawn_mob()

func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)

func spawn_powerup():
	var new_powerup = preload("res://powerup.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_powerup.global_position = %PathFollow2D.global_position
	add_child(new_powerup)

func spawn_tree():
	var new_tree = preload("res://pine_tree.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_tree.global_position = %PathFollow2D.global_position
	add_child(new_tree)

func _on_mob_spawn_timeout():
	spawn_mob()


func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true


func _on_power_up_timeout():
	spawn_powerup()
	spawn_tree()

func _on_pontuacao_timeout():
	score += 1
	%Pontos.set_text(str(score))
