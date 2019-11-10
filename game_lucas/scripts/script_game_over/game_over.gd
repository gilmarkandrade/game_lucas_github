extends Control

func _ready():
	pass


func _on_restart_game_pressed():
	atributos_fase_singleton.mudarposicao = 0
	atributos_player_singleton.life_player = 100
	atributos_player_singleton.mana_player = 100
	atributos_player_singleton.fire_stop = false
	atributos_fase_singleton.anim_close_door_finalized = 0
	
	if (atributos_fase_singleton.fase_restart == 0):
		get_tree().change_scene("res://cenas_globais/Menu_Inicial/menu_inicial.tscn")
	if (atributos_fase_singleton.fase_restart == 1):
		get_tree().change_scene("res://fases/fase_1/world_1_cena_1.tscn")
	if (atributos_fase_singleton.fase_restart == 2):
		atributos_fase_singleton.block_break = false
		atributos_fase_singleton.plataform_motion = 1
		get_tree().change_scene("res://fases/fase_2/world_2_cena_1.tscn")
	if (atributos_fase_singleton.fase_restart == 3):
		get_tree().change_scene("res://fases/fase_3/world_3_cena_1.tscn")
	if (atributos_fase_singleton.fase_restart == 4):
		get_tree().change_scene("res://fases/fase_4/world_4_cena_1.tscn")
	if (atributos_fase_singleton.fase_restart == 5):
		get_tree().change_scene("res://fases/fase_5/world_5_cena_1.tscn")
	pass
