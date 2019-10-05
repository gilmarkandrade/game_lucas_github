extends KinematicBody2D

var move = Vector2()
var speed = 150

var life = atributos_player_singleton.life_player
var attacking = false


func _physics_process(delta):
	# olhar na direção do mouse
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("ui_atack"):
		$animation_player.current_animation = "atack_animation"
		attacking = true
		
		
	if Input.is_action_pressed("ui_left"):
		move.x =- speed
		if attacking == false:
			$animation_player.current_animation = "walk_animation"
		else:
			move.x =- speed /3
	elif Input.is_action_pressed("ui_right"):
		move.x =+ speed
		if attacking == false:
			$animation_player.current_animation = "walk_animation"
		else:
			move.x =+ speed /3
	elif Input.is_action_pressed("ui_up"):
		move.y =- speed
		if attacking == false:
			$animation_player.current_animation = "walk_animation"
		else:
			move.y =- speed /3
	elif Input.is_action_pressed("ui_down"):
		move.y =+ speed
		if attacking == false:
			$animation_player.current_animation = "walk_animation"
		else:
			move.y =+ speed /3
	else:
		move.x = 0
		move.y = 0
		if attacking == false:
			$animation_player.current_animation = "idlle_animation"
	move = move_and_slide(move)

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "atack_animation":
		attacking = false
