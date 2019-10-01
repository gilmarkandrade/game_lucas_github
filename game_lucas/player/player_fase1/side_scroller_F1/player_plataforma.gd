extends KinematicBody2D

var move = Vector2()
var speed = 30
var life = 100
var damage_hit = 10
var side_current = false
var death = false
const jump_force = -300
const gravity = 9
const UP = Vector2(0,-1)

#========================================================
#                MOVIMENTAÇÃO
#========================================================

func _physics_process(delta):
	move.y += gravity
	
	if death == false:
		
		# movimentação do player esquerda ou direita ou parado se não estiver recebendo input
		
		if Input.is_action_pressed("ui_right"):
			move.x += speed
			$animation_Player.current_animation = "walk_animation"
			$sprite_player.flip_h = false
			
		elif Input.is_action_pressed("ui_left"):
			move.x -= speed
			$animation_Player.current_animation = "walk_animation"
			$sprite_player.flip_h = true
		
		else:
			move.x = 0
			if is_on_floor():
				if Input. is_action_just_pressed("ui_up"):
					move.y = jump_force
		move = move_and_slide(move,UP)
	
	
#=================================================================
#                   FUNCTIONS
#=================================================================

func atack_proximity():
	if side_current == false:
		$animation_Player.play("atack_1_animation_left")
	elif side_current ==true:
		$animation_Player.play("atack_1_animation_right")

# função responsavel por travar o codigo do game e chamar 
#a cena game over caso avida chegue a zero
func death_player():
	if life <= 0:
		life = 0 
		death = true
		
		
	
#===========================================================
#                  AREA\BODY ENTERED
#===========================================================


#AREA responsavel por receber o valor de dano conforme a area inimiga 
# que entrou no corpo do player
func _on_area_corpo_player_area_entered(area):
	if area.is_in_group("weapom_enimie"):
		life =  atributos_player_singleton.life_player
		death_player()



func _on_area_arma_player_area_entered(area):
	
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

