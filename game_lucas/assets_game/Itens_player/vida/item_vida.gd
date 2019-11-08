extends Area2D

func _ready():
	pass 

func _on_item_vida_body_entered(body):
	if body.is_in_group("player"):
		atributos_player_singleton.life_player += 25
		if atributos_player_singleton.life_player > 100:
			atributos_player_singleton.life_player = 100
	pass 
