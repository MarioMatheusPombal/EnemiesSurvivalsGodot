extends Area2D

func _ready():
	pass
	
func take_powerup():
	queue_free()


func _on_body_entered(body):
	if body.has_method("powerupspd"):
		body.powerupspd()
		queue_free()
