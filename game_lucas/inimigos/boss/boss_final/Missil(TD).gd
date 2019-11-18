extends Area2D
var up
var down
var front
var motion = Vector2() 
var speed = 0.5
var damage = 10
var stop = false



func _process(delta):
	
	if stop == false :
		if front == true:
			move_projetil_front()
		if up == true:
			move_projetil_up()
		if down == true:
			move_projetil_down()

func move_projetil_front():
	motion.x -= speed
	translate(motion)

func move_projetil_up():
	motion.x -= speed
	motion.y += 0.1
	translate(motion)

func move_projetil_down():
	motion.x -= speed
	motion.y -= 0.1
	translate(motion)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_flecha_body_entered(body):
	if body. is_in_group("player"):
		atributos_player_singleton.player_life_update(damage)
		stop = true
		queue_free()
		
	
