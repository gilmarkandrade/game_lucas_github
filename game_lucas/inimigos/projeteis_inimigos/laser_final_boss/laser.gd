extends Area2D
var side
var motion = Vector2() 
var damage = 0.5
var stop = false
var iniciar_dano = false


func _process(delta):
	if stop == false :
		move_projetil()
	if iniciar_dano == true:
		atributos_player_singleton.life_player -= damage
	
func move_projetil():
	motion.x = 0.18
	translate(motion)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_flecha_body_entered(body):
	if body. is_in_group("player"):
		iniciar_dano = true

func _on_Timer_timeout():
	queue_free()
	pass


func _on_laser_body_exited(body):
	iniciar_dano = false
	if atributos_player_singleton.life_player <= 0:
		atributos_player_singleton.life_player += -10
