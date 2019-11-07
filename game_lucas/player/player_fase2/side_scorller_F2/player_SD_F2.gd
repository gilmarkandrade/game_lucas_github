extends KinematicBody2D

var move = Vector2()
var speed = 180
var life = 100
var attacking= false
var damage_hit = 10
var side_current = false
var death = false
const jump_force = -300
const gravity = 9
const UP = Vector2(0,-1)
var get_weapon_away = atributos_fase_singleton.get_weapom_away
var fire_stop = atributos_player_singleton.fire_stop
var orb_fire = preload( "res://player/player_fase2/side_scorller_F2/orb_fogo_SD/orb__de_fogo_SD.tscn")


#========================================================
#                MOtion player
#========================================================

func _physics_process(delta):
	# salva e passa o valor da posição do player
	var pos = $".".global_position
	atributos_player_singleton.update_position_player(pos)
	move.y += gravity
	# defini a visibilade do player
	$cajado.visible = atributos_fase_singleton.get_weapom_away
	if death == false and atributos_player_singleton.stop_player == false:
		
		# movimentação do player esquerda ou direita ou parado se não estiver recebendo input
		if Input.is_action_just_pressed("ui_atack"):
			attacking = true
			atack_proximity()
			
		if Input . is_action_just_pressed("ui_fire_atack") and attacking == false:
			fire_atack()
			
		if Input.is_action_pressed("ui_right"):
			if attacking == false :
				move.x =+ speed
			side_current = false
			if is_on_floor() and attacking == false:
				$animation_Player .current_animation = "walk_animation"
			$sprite_player.flip_h = false
			
		elif Input.is_action_pressed("ui_left"):
			if attacking == false :
				move.x =- speed
			side_current = true
			if is_on_floor() and attacking == false:
				$animation_Player .current_animation = "walk_animation_left"
			$sprite_player.flip_h = true
		
		else:
			move.x = 0
			
			if is_on_floor() and attacking == false:
				if side_current == false:
					$animation_Player.current_animation = "idlle_animation"
				if side_current == true:
					$animation_Player.current_animation = "idlle_animation_left"
				
		if is_on_floor():
			if Input. is_action_just_pressed("ui_up"):
				move.y = jump_force
					
		else:
			if move.y <- 0.1 and attacking == false:
				if side_current == false:
					$animation_Player.current_animation = "jump_up"
				elif side_current == true :
					$animation_Player.current_animation = "jump_up_left"
			
			
			elif move.y > 0.1 and attacking == false :
				if side_current == false :
					$animation_Player.current_animation ="jump_down"
				elif side_current == true :
					$animation_Player.current_animation ="jump_down_left"
		move = move_and_slide(move,UP)
	
	
#=================================================================
#                   FUNCTIONS
#=================================================================
# esta função é para o ataque de armas de mão de curto alcance 
func atack_proximity():
	
	if side_current == true:
		$animation_Player.current_animation = "atack_1_animation_left"
		move.x =0
	elif side_current ==false:
		$animation_Player.current_animation = "atack_1_animation_right"
		move.x =0
		
func fire_atack():
	#get_weapon_away recebe o vaolor do singleton atributos fase e defini se oplayer ja possui ou nao o cajado
	get_weapon_away = atributos_fase_singleton.get_weapom_away
	$cajado.visible = atributos_fase_singleton.get_weapom_away
	fire_stop = atributos_player_singleton.fire_stop
	if get_weapon_away == true and fire_stop == false:
		var O_F = orb_fire.instance()
		O_F. side = side_current
		get_parent().add_child(O_F)
		O_F.position = $position_projetil.global_position
		
		
	
# função responsavel por travar o codigo do game e chamar 
#a cena game over caso avida chegue a zero
func death_player():
	if life <= 0:
		life = 0 
		death = true
		if side_current == false :
			$animation_Player.play("death_animation")
		elif side_current == true:
			$animation_Player.play("death_animation_left")
		
	
#===========================================================
#                  AREA\BODY ENTERED
#===========================================================


#AREA responsavel por receber o valor de dano conforme a area inimiga 
# que entrou no corpo do player
func _on_area_corpo_player_area_entered(area):
	if area.is_in_group("weapom_enimie"):
		life =  atributos_player_singleton.life_player
		death_player()
	if area .is_in_group("projetil_inimigo"):
		life = atributos_player_singleton.life_player
		death_player()


func _on_area_arma_player_area_entered(area):
	#envia o valor de dano toda vez que a colisão da arma do player 
	#entrar no corpo de inimigos este valor vai para o game singleto atributos_player_singleton
	if area.is_in_group("enemie"):
		atributos_player_singleton.damage_life_enimie_update(damage_hit)
		

#==========================================================
#               animation finished
#==========================================================

#quando alguma animação finalizar execute o evento 
func _on_animation_Player_animation_finished(anim_name):
	if anim_name == "death_animation":
		# quando terminara animacao de morte do player va para tela de gameover
		get_tree().change_scene("res://cenas_globais/game_over.tscn")
		
	elif anim_name == "death_animation_left":
		# quando terminara animacao de morte do player va para tela de gameover
		get_tree().change_scene("res://cenas_globais/game_over.tscn")
	
	elif anim_name == "atack_1_animation_left":
		attacking = false
	elif anim_name == "atack_1_animation_right":
		attacking = false

