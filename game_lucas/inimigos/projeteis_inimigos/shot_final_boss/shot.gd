extends Area2D
var motion = Vector2() 
var speed = 1.5
var damage = 8
var stop = false



func _process(delta):
	
	if stop == false :
		move_projetil()

func move_projetil():
	motion.x -= speed 
	translate(motion)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_flecha_body_entered(body):
	if body. is_in_group("player"):
		atributos_player_singleton.player_life_update(damage)
		stop = true
		queue_free()
		
	
