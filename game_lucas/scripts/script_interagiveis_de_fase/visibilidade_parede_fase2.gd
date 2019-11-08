extends Area2D


func _on_area_visibilidade_parede_body_entered(body):
	if body.is_in_group("player"):
		$Parede_side2.self_modulate.a = 0


func _on_area_visibilidade_parede_body_exited(body):
	if body.is_in_group("player"):
		$Parede_side2.self_modulate.a = 1