extends Area2D






func _on_area_armadilha_body_entered(body):
	if body.is_in_group("player") and atributos_fase_singleton.plataform_motion == 1:
		$"../animation_cena5".play("plataform_dow")
		atributos_player_singleton.stop_movement_player(true)
		atributos_fase_singleton.animation_plataform_dow(1)


func _on_animation_cena5_animation_finished(anim_name):
		atributos_player_singleton.stop_movement_player(false)


func _on_area_alavanca_area_entered(area):
	if area.is_in_group("arma_player"):
		$"../animation_cena5".play("plataform_up")


func _on_area_lava_body_entered(body):
	if body.is_in_group("player"):
		atributos_player_singleton.player_life_update(110)
		print("foi")
		

