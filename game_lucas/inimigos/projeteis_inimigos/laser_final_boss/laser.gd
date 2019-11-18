extends Area2D
var side
var motion = Vector2() 
var damage = 8
var stop = false



func _process(delta):
	
	if stop == false :
		move_projetil()

func move_projetil():
	motion.x = 0.18
	translate(motion)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_flecha_body_entered(body):
	if body. is_in_group("player"):
		atributos_player_singleton.player_life_update(damage)


func _on_Timer_timeout():
	queue_free()
	pass
