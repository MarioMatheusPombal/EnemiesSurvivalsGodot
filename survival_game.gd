extends Node2D

func _ready():
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

func _on_mob_spawn_timeout():
	spawn_mob()


func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true


func _on_power_up_timeout():
	spawn_powerup()

