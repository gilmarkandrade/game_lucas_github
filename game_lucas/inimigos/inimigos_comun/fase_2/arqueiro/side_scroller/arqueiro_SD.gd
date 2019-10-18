extends KinematicBody2D

var move = Vector2()
var speed = 6
var life = 100
var attacking = false
var death = false
var side_current = false
var are_in_area = false
var arrow = preload("res://inimigos/projeteis_inimigos/flecha_Fase_2/flecha.tscn")


func _physics_process(delta):
	move.y += speed
	move_and_slide(move)

func death():
	if life <= 0:
		death = true
		life = 0
		$animation_arqueiro_SD.current_animation = "death_animation"

func fire_atack():
	if side_current == false and attacking == true and death == false:
		$animation_arqueiro_SD.current_animation = "atack_animation_left"
		
	if side_current == true and attacking == true and death == false:
		$animation_arqueiro_SD.current_animation = "atack_animation_rigth"

func create_arrow():
	var A_R_W = arrow.instance()
	A_R_W.side = side_current
	get_parent().add_child(A_R_W)
	A_R_W.position = $position_projetil.global_position
	
#============================================================================
#                          BODY ENTERED
#============================================================================


func _on_area_atack_left_body_entered(body):
	if body.is_in_group("player") and death == false:
		side_current = false
		attacking = true
		are_in_area = true
		fire_atack()
	



func _on_area_atack_left_body_exited(body):
	if body.is_in_group("player")and death == false:
		attacking = false
		are_in_area = false
		$delay_atack_stop.start()
	


func _on_area_atack_rigth_body_entered(body):
	if body.is_in_group("player") and death == false:
		side_current = true
		attacking = true
		are_in_area = true
		fire_atack()
	


func _on_area_atack_rigth_body_exited(body):
	if body.is_in_group("player") and death == false:
		attacking = false
		are_in_area = false
		$delay_atack_stop.start()


func _on_area_corpo_body_entered(body):
	pass # Replace with function body.


func _on_area_corpo_area_entered(area):
	death()
	if area.is_in_group("arma_player") and death == false:
		life -= (atributos_player_singleton.life_enemie_update +30)
		
	if area.is_in_group("projetil_player"):
		life -= atributos_player_singleton.life_enemie_update
		
	


func _on_delay_atack_stop_timeout():
	if are_in_area == false and death == false:
		$animation_arqueiro_SD.current_animation = "idlle_animation"
	


func _on_animation_arqueiro_SD_animation_finished(anim_name):
	if anim_name == "atack_animation_left" and death == false:
		create_arrow()
		if are_in_area == true and death == false and side_current == false:
			$animation_arqueiro_SD.current_animation = "atack_animation_left"

	elif anim_name == "atack_animation_rigth" and death == false:
		create_arrow()
		if are_in_area == true and death == false and side_current == true:
			$animation_arqueiro_SD.current_animation = "atack_animation_rigth"
	if anim_name == "death_animation":
		queue_free()



