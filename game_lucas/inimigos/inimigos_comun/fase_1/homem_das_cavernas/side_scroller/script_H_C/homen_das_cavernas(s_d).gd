extends KinematicBody2D


var death = false 
var walking = false 
var atacking = false
var right_side = false
var left_side= false
var life = 100
var damage = 5 
var move = Vector2()
var velocity = 50

const gravity = 9

#em desenvolvimento
func _physics_process(delta):
	move.y += gravity
	
	if death == false:
		walk_left_right_side()

func walk_left_right_side():
	if left_side == true and atacking == false and walking == true:
		move.x =- velocity
	
			
		$animation_H_C.current_animation = "walk_animaton"
		$sprite_H_C.flip_h = true
	elif right_side == true and atacking == false and walking == true :
		move.x =+ velocity
		$sprite_H_C.flip_h = false
		$animation_H_C.current_animation = "walk_animaton"
		
	else :
		move.x
		if atacking == false:
			$animation_H_C.current_animation = "idlle_animation"
	move = move_and_slide(move)


#==============================================================
#                        functions
#==============================================================


#função que chama animaçao de ataque e passa o valor de dano 
# para o player atraves do singleton atributos player singleton
func atack():
	if left_side == true and atacking == true and death == false:
		move.x = 0
		atributos_player_singleton.player_life_update(damage)
		$animation_H_C.play("atack_left_animation")
	if right_side == true and atacking == true and death == false:
		move.x = 0
		atributos_player_singleton.player_life_update(damage)
		$animation_H_C.play("atack_rigth_animation")
		


func damage_death():
	
	if life <= 0 :
		death = true
		$animation_H_C.play("death_animation")
	
#===========================================================
#            AREA\BODY ENTERED
#===========================================================



#  quando player entra na area de colisao do lado esquerdo 
#ele defini estas variaveis que permitira que ação seja feita  

func _on_area_lado_esquerdo_move_body_entered(body):
		if body.is_in_group("player") and death == false:
			left_side = true
			right_side = false
			atacking = false 
			walking = true


func _on_area_lado_direito_move_body_entered(body) :
	if body.is_in_group("player") and death == false:
			left_side = false
			right_side = true 
			atacking = false
			walking = true
			
#======================== area atacking =======================
  
#area proxima o player que permite ele atacar se o player chegar muito perto 
func _on_area_esquerda_ataque_body_entered(body):
	if body.is_in_group("player") and death == false:
		atacking = true
		left_side = true
		right_side = false 
		$delay_atack.start()
	


func _on_area_direita_ataque_body_entered(body):
	if body.is_in_group("player") and death == false:
		atacking = true
		left_side = false
		right_side = true 
		
		$delay_atack.start()
#====================================================
#                    BODY EXITED
#====================================================
func _on_area_lado_direito_move_body_exited(body):
	if body.is_in_group("player") and death == false:
		$delay_atack.stop()
		atacking = false

	
	
	
func _on_area_lado_esquerdo_move_body_exited(body):
	if body.is_in_group("player") and death == false:
		$delay_atack.stop()
		atacking = false

	
# ===================== area corpo =====================

# corpo do player onde ele recebe e puxa a 
#referencia do valor que foi passado para ogame singleton
func _on_area_corpo_H_C_area_entered(area):
	
	if area.is_in_group("arma_player") and death == false:
		life -= atributos_player_singleton.life_enemie_update
		damage_death()
		print(life)
	
	
	
#==============================================================
#                         DELAY
#==============================================================

func _on_delay_atack_timeout():
	
	atack()

	
	
#===============================================================
#               ANIMATION FINISHED
#===============================================================

func _on_animation_H_C_animation_finished(anim_name):
	if anim_name == "death_animation":
		queue_free()
	#if anim_name =="atack_rigth_animation":
	#	atacking = false
	#if anim_name =="atack_left_animation":
	#	atacking = false






