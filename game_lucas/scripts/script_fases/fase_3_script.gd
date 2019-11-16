extends Node
var entrou_area_1 = false
var entrou_area_2 = false
var entrou_area_3 = false
var entrou_area_4 = false
var entrou_area_5 = false
var entrou_area_6 = false
var entrou_area_7 = false
var entrou_area_8 = false
var novapos = atributos_fase_singleton.mudarposicao


func _ready():
	atributos_fase_singleton.fase_restart = 3
	novapos  = atributos_fase_singleton.mudarposicao
	if novapos == 0 :
		$player_top_down_F3.position = $position_inicio_cena1.global_position
	if novapos == 1 :
		$player_top_down_F3.position = $position_retorno_cena1.global_position
	if novapos == 2:
		$player_SD_F3.position = $position_inicio_cena2.global_position
	if novapos == 3 :
		$player_SD_F3.position = $position_retorno_cena3.global_position
	if novapos == 4:
		$player_top_down_F3.position = $position_inicio_cena3.global_position
	if novapos == 5:
		#$player_SD_F3.position = $position_retorno_cena3.global_position
		pass
func _process(delta):
	if entrou_area_1 == true :
		if Input.is_action_just_pressed("ui_accept") and atributos_fase_singleton.in_area_perspective == true:
			get_tree().change_scene("res://fases/fase_3/world_3_cena_2.tscn")
	elif entrou_area_2 == true:
		if Input.is_action_just_pressed("ui_accept")and atributos_fase_singleton.in_area_perspective == true:
			get_tree().change_scene("res://fases/fase_3/world_3_cena_1.tscn")
	elif entrou_area_3 == true:
		if Input.is_action_just_pressed("ui_accept")and atributos_fase_singleton.in_area_perspective == true:
			get_tree().change_scene("res://fases/fase_3/world_3_cena_3.tscn")
	elif entrou_area_4 == true:
		if Input.is_action_just_pressed("ui_accept")and atributos_fase_singleton.in_area_perspective == true:
			get_tree().change_scene("res://fases/fase_3/world_3_cena_2.tscn")
	elif entrou_area_5 == true :
		if Input.is_action_just_pressed("ui_accept")and atributos_fase_singleton.in_area_perspective == true:
			get_tree().change_scene("res://fases/fase_3/world_3_cena_4.tscn")
		
#=====================================================================================================
#                                           BODY ENTERED 
#=====================================================================================================

func _on_area_entrar_cena2_body_entered(body):
	if body.is_in_group("player"):
		entrou_area_1 = true
		novapos = 2
		atributos_fase_singleton.setar_posicao(novapos)
		


func _on_area_retorno_cena_1_body_entered(body):
	if body.is_in_group("player"):
		entrou_area_2 = true
		entrou_area_3 = false
		novapos = 1
		atributos_fase_singleton.setar_posicao(novapos)
	


func _on_area_entrar_cena3_body_entered(body):
	if body.is_in_group("player"):
		entrou_area_3 = true
		entrou_area_2 = false
		novapos = 4
		atributos_fase_singleton.setar_posicao(novapos)


func _on_area_retorno_cena2_body_entered(body):
	if body.is_in_group("player"):
		entrou_area_4 = true
		entrou_area_5 = false
		novapos = 3
		atributos_fase_singleton.setar_posicao(novapos)



func _on_area_entrar_cena4_body_entered(body):
	if body.is_in_group("player"):
		entrou_area_5 = true
		entrou_area_4 = false
		novapos = 5
		atributos_fase_singleton.setar_posicao(novapos)
