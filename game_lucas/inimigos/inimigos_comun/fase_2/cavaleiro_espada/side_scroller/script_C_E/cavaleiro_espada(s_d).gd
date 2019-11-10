extends KinematicBody2D


var death = false 
var walking = false 
var atacking = false
var right_side = false
var left_side= false
var idlle_status = true
var life = 100
var damage = 5 
var move = Vector2()
var velocity = 50
var item_vida = preload("res://assets_game/Itens_player/vida/item_vida.tscn")
var item_mana = preload("res://assets_game/Itens_player/municao_mana/item_municao.tscn")
var item_probability = RandomNumberGenerator.new()
var item_type = 0

const gravity = 9

#em desenvolvimento
func _physics_process(delta):
	move.y += gravity
	
	if death == false:
		walk_left_right_side()




#==============================================================
#                        functions
#==============================================================

# função de movimento IA
func walk_left_right_side():
	if left_side == true and atacking == false and walking == true:
		move.x =- velocity
		$delay_atack.stop()
		$animation_H_C.current_animation = "walk_animaton"
		$sprite_H_C.flip_h = true
	elif right_side == true and atacking == false and walking == true :
		move.x =+ velocity
		$delay_atack.stop()
		$sprite_H_C.flip_h = false
		$animation_H_C.current_animation = "walk_animaton"
		
	else :
		move.x = 0
		if atacking == false and walking == false and idlle_status == true:
			$animation_H_C.play("idlle_animation")

	move = move_and_slide(move)


#função que chama animaçao de ataque 

func atack():
	move.x = 0
	if left_side == true and atacking == true and death == false:
		atributos_player_singleton.player_life_update(damage)
		$animation_H_C.current_animation ="atack_left_animation"
	elif right_side == true and atacking == true and death == false:
		atributos_player_singleton.player_life_update(damage)
		$animation_H_C.current_animation = "atack_rigth_animation"
		
#função de morte

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
			walking = true
			if walking == true:
				$delay_atack.stop()
			

# area de indicação de movimento da ia 
func _on_area_lado_direito_move_body_entered(body) :
	if body.is_in_group("player") and death == false:
			left_side = false
			right_side = true 
			walking = true
			if walking == true:
				$delay_atack.stop()
#======================== area atacking =======================
  
#area proxima o player que permite ele atacar se o player chegar muito perto 
func _on_area_esquerda_ataque_body_entered(body):
	if body.is_in_group("player") and death == false:
		atacking = true
		idlle_status = false
		walking = false
		left_side = true
		right_side = false
		if walking == false: 
			$delay_atack.start()
		
	
#colisor lado direito de acordo com estas variaveis o inimigo fara uma ação
#ex: se walking == true e atacking ==false e de acordo com o lado que o player esta
# ele ira andar se walking false e atacking == true então ele fara animação de ataque
# de acordo com o lado que ele esta,a variavel que seta o lado é asvariaveis
# left_side e right_side atenão a isso para que não haja conflito sempre quando setar 
#uma como verdadeiro a outra deve ser definida como false 

func _on_area_direita_ataque_body_entered(body):
	if body.is_in_group("player") and death == false:
		atacking = true
		idlle_status = false
		walking = false
		left_side = false
		right_side = true 
		if walking == false: 
			$delay_atack.start()
#====================================================
#                    BODY EXITED
#====================================================
# quando sair da area de ataque lado esquerdo
func _on_area_esquerda_ataque_body_exited(body):
	if body.is_in_group("player") and death == false:
		$delay_atack.stop()
		atacking = false
		idlle_status = true
		walking = true
		

	
	# quando sair da area de ataque lado direito
func _on_area_direita_ataque_body_exited(body):
	if body.is_in_group("player") and death == false:
		atacking = false
		idlle_status = true
		walking = true
		$delay_atack.stop()
	
	
# ===================== area corpo =====================

# corpo do player onde ele recebe e puxa a 
#referencia do valor que foi passado para ogame singleton
func _on_area_corpo_H_C_area_entered(area):
	
	if area.is_in_group("arma_player") and death == false:
		life -= atributos_player_singleton.life_enemie_update
		damage_death()


#============ area arma inimigo =======================

# passa o valor de dano para game singleton que  o player ira receber
func _on_area_arma_inimigo_body_entered(body):
	if body.is_in_group("player") and death == false:
		atributos_player_singleton.player_life_update(damage)
	
	
#==============================================================
#                         DELAY
#==============================================================
# delay que inicia o ataque
func _on_delay_atack_timeout():
	
	atack()

#==============================================================
#                         ITEM RANDOM
#==============================================================

func random_item():
	item_probability. randomize()
	var random_item = item_probability. randi_range(1,10)
	item_type = random_item

func spaw_item():
	random_item()
	if item_type == 1 :
		var IV = item_vida.instance()
		get_parent().add_child(IV)
		IV.scale.x = 0.6
		IV.scale.y = 0.6
		IV.position = $".".global_position
	if item_type == 2 :
		var IM = item_mana.instance()
		get_parent().add_child(IM)
		IM.scale.x = 0.6
		IM.scale.y = 0.6
		IM.position = $".".global_position


#===============================================================
#               ANIMATION FINISHED
#===============================================================

# quando animação acaba 
func _on_animation_H_C_animation_finished(anim_name):
	if anim_name == "death_animation":
		spaw_item()
		queue_free()







