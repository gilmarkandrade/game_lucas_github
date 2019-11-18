extends Area2D
var side
var motion = Vector2() 
var speed = 0.5
var damage = 8
var stop = false
var up = true
var M1
var M2
var M3

func _process(delta):
	
	if stop == false :
		if M1 == true:
			move_projetil1()
		if M2 == true:
			move_projetil2()
		if M3 == true:
			move_projetil3()
		
func move_projetil1():

	motion.x -= 0.01
	if up == true:
		motion.y -= 0.01
		if motion.y < -1.6:
			up = false
	else:
		motion.y += 0.06
		$sprite_flecha.rotation -= 0.015
		if $sprite_flecha.rotation < -2:
			$sprite_flecha.rotation = -2
	print($sprite_flecha.rotation)
	translate(motion)

func move_projetil2():

	motion.x -= 0.01
	if up == true:
		motion.y -= 0.01
		if motion.y < -1.3:
			up = false
	else:
		motion.y += 0.06
		$sprite_flecha.rotation -= 0.015
		if $sprite_flecha.rotation < -2:
			$sprite_flecha.rotation = -2
	print($sprite_flecha.rotation)
	translate(motion)

func move_projetil3():

	motion.x -= 0.01
	if up == true:
		motion.y -= 0.01
		if motion.y < -1:
			up = false
	else:
		motion.y += 0.06
		$sprite_flecha.rotation -= 0.015
		if $sprite_flecha.rotation < -2:
			$sprite_flecha.rotation = -2
	print($sprite_flecha.rotation)
	translate(motion)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_flecha_body_entered(body):
	if body. is_in_group("player"):
		atributos_player_singleton.player_life_update(damage)
		stop = true
		queue_free()
		
	
