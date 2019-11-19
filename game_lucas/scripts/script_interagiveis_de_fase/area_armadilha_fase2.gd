extends Area2D

func _ready():
	if atributos_fase_singleton.finalized_plataform_quest == false:
		atributos_fase_singleton.plataform_motion = 1




func _on_area_armadilha_body_entered(body):
	if body.is_in_group("player") and atributos_fase_singleton.plataform_motion == 1:
		$"../animation_cena5".play("plataform_dow")
		atributos_player_singleton.stop_movement_player(true)
		atributos_fase_singleton.animation_plataform_dow(1)


func _on_animation_cena5_animation_finished(anim_name):
		atributos_player_singleton.stop_movement_player(false)
		if anim_name == "plataform_up":
			atributos_fase_singleton.finalized_plataform_quest = true


func _on_area_alavanca_area_entered(area):
	if area.is_in_group("arma_player"):
		$"../animation_cena5".play("plataform_up")
		$som_ALAVANCA.play()


func _on_area_lava_body_entered(body):
	if body.is_in_group("player"):
		atributos_player_singleton.player_life_update(110)
		
		

