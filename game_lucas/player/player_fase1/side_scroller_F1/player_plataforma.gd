extends KinematicBody2D

var move = Vector2()
var speed = 180
var life = 100
var attacking= false
var damage_hit = 10
var side_current = false
var death = false
var camera_shake_emitter= false
var camera_zoom_emitter = 1
const jump_force = -300
const gravity = 9
const UP = Vector2(0,-1)


#========================================================
#                MOtion player
#========================================================

func _physics_process(delta):
	var pos = $".".global_position
	atributos_player_singleton.update_position_player(pos)
	move.y += gravity
	
	if death == false:
		
		# movimentação do player esquerda ou direita ou parado se não estiver recebendo input
		if Input.is_action_just_pressed("ui_atack"):
			attacking = true
			atack_proximity()
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
				$animation_Player .current_animation = "walk_animation"
			$sprite_player.flip_h = true
		
		else:
			move.x = 0
			
			if is_on_floor() and attacking == false:
				$animation_Player.current_animation = "idlle_animation"
				
		if is_on_floor():
			if Input. is_action_just_pressed("ui_up"):
				move.y = jump_force
					
		else:
			if move.y <- 0.1 and attacking == false:
				$animation_Player.current_animation = "jump_up"
			elif move.y > 0.1 and attacking == false :
				$animation_Player.current_animation ="jump_down"
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
# função responsavel por travar o codigo do game e chamar 
#a cena game over caso avida chegue a zero
func death_player():
	if life <= 0:
		life = 0 
		death = true
		$animation_Player.play("death_animation")
		
		
	
#===========================================================
#                  AREA\BODY ENTERED
#===========================================================


#AREA responsavel por receber o valor de dano conforme a area inimiga 
# que entrou no corpo do player
func _on_area_corpo_player_area_entered(area):
	if area.is_in_group("weapom_enemie"):
		life =  atributos_player_singleton.life_player
		death_player()
		camera_shake_emitter = true
		atributos_player_singleton.aply_camera_shake(camera_shake_emitter)
		$delay_camera_shake.start()


func _on_area_arma_player_area_entered(area):
	#envia o valor de dano toda vez que a colisão da arma do player 
	#entrar no corpo de inimigos este valor vai para o game singleto atributos_player_singleton
	if area.is_in_group("enemie"):
		atributos_player_singleton.damage_life_enimie_update(damage_hit)
		camera_zoom_emitter = 1
		atributos_player_singleton.aply_camera_zoom(camera_zoom_emitter)
		$delay_camera_zoom.start()
		
#=====================================================
#                    DELAY
#=====================================================
func _on_delay_camera_shake_timeout():
	camera_shake_emitter = false
	atributos_player_singleton.aply_camera_shake(camera_shake_emitter)
	
func _on_delay_camera_zoom_timeout():
		camera_zoom_emitter = 4
		atributos_player_singleton.aply_camera_zoom(camera_zoom_emitter)

#==========================================================
#               animation finished
#==========================================================

#quando alguma animação finalizar execute o evento 
func _on_animation_Player_animation_finished(anim_name):
	if anim_name == "death_animation":
		# quando terminara animacao de morte do player va para tela de gameover
		get_tree().change_scene("res://cenas_globais/game_over.tscn")
	elif anim_name == "atack_1_animation_left":
		attacking = false
	elif anim_name == "atack_1_animation_right":
		attacking = false






