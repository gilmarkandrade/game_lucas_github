extends KinematicBody2D

var move = Vector2()
var speed = 200
var death  = false
var damage = 30
var bullet = preload("res://player/player_fase2/top_down_F2/projetil_player_TD.tscn")
var fire_stop = atributos_player_singleton.fire_stop
var life = atributos_player_singleton.life_player
var attacking = false

func _ready():
	$CollisionShape2D/cajado. visible = atributos_fase_singleton.get_weapom_away
func _physics_process(delta):
	var pos = $".".global_position
	atributos_player_singleton.update_position_player(pos)
	if death == false :
		# olhar na direção do mouse
		look_at(get_global_mouse_position())
	
		if Input.is_action_just_pressed("ui_atack"):
			$animation_player.current_animation = "atack_animation"
			attacking = true
		elif Input.is_action_just_pressed("ui_fire_atack") and attacking == false:
			fire_stop = atributos_player_singleton.fire_stop
			shoot_bullet()
			
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
	if anim_name == "death_animation":
		get_tree().change_scene("res://cenas_globais/game_over.tscn")


func shoot_bullet():
	
	if fire_stop == false and atributos_fase_singleton. get_weapom_away == true:
		var B_L = bullet. instance()
		get_parent().add_child(B_L)
		B_L.pos = $position_bullet.global_position
		B_L.target = $position_bullet_final.global_position
		B_L.position = $position_bullet.global_position
		B_L.look_at(get_global_mouse_position())
	
func death_player():
	
	if life <= 0:
		death = true
		$animation_player.current_animation ="death_animation"
		
		

func _on_arma_player_body_entered(body):
	if body.is_in_group("enemie") and death == false:
		atributos_player_singleton.damage_life_enimie_update(damage)
	
	


func _on_area_corpo_player_area_entered(area):
	if area.is_in_group("weapom_enemie"):
		life = atributos_player_singleton.life_player
		death_player()
		if death == false:
			$som_dano.play()
	elif area.is_in_group("projetil_inimigo"):
		life = atributos_player_singleton.life_player
		death_player()
		if death == false:
			$som_dano.play()
	elif area.is_in_group("armadilha"):
		$delay_death_special.start()
		



func _on_delay_death_special_timeout():
	life =-10
	death_player()
