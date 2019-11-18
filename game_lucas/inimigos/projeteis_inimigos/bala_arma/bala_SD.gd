extends Area2D
var side
var motion = Vector2() 
var speed = 1.5
var damage = 8
var stop = false



func _process(delta):
	
	if stop == false :
		move_projetil()

func move_projetil():

	if side == false :
		motion.x -= speed 
		$projetil.flip_h = false
	if side == true:
		motion.x += speed 
		$projetil.flip_h = true
	translate(motion)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_flecha_body_entered(body):
	if body. is_in_group("player"):
		atributos_player_singleton.player_life_update(damage)
		stop = true
		queue_free()
	
	


func _on_bala_arma_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.is_in_group("bloqueio"):
		queue_free()
		stop = true
