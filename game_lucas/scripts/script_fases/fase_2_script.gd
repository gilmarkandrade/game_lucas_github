extends Node

var novapos
var entrou_na_area1 = false
var entrou_na_area2 = false
var entrou_na_area3 = false
var entrou_na_area4 = false
var entrou_na_area5 = false
var entrou_na_area6 = false
var entrou_na_area7 = false

func _on_entrar_cena2_body_entered(body):
	if body.is_in_group("player"):
		entrou_na_area2 = false
		entrou_na_area1 = true
		novapos = 1
		atributos_fase_singleton.setar_posicao(novapos)
	

func _on_entrar_direto_cena3_body_entered(body):
	if body.is_in_group("player"):
		entrou_na_area3 = false
		entrou_na_area2 = true 
		novapos = 2
		atributos_fase_singleton.setar_posicao(novapos)
	

func _on_retorno_direto_cena2_body_entered(body):
	if body.is_in_group("player"):
		entrou_na_area2 = false
		entrou_na_area3 = true
		novapos = 3
		atributos_fase_singleton.setar_posicao(novapos)
	

func _on_entrar_direto_cena4_body_entered(body):
	if body.is_in_group("player"):
		entrou_na_area4 = true
		entrou_na_area3 = false
		novapos = 4
		atributos_fase_singleton.setar_posicao(novapos)

func _on_area_retorno_cena3_body_entered(body):
	
	if body.is_in_group("player") and atributos_fase_singleton.get_weapom_away == true:
		entrou_na_area5 = true
		entrou_na_area4 = false
		entrou_na_area6 = false
		novapos = 5
		atributos_fase_singleton.setar_posicao(novapos)

func _on_area_entrar_cena5_body_entered(body):
	if body.is_in_group("player"):
		entrou_na_area6 = true
		entrou_na_area5 = false
		entrou_na_area4 = false
		novapos = 6
		atributos_fase_singleton.setar_posicao(novapos)


func _on_area_retorno_cena5_para3_body_entered(body):
	
	if body.is_in_group("player"):
		entrou_na_area7 = true
		entrou_na_area6 = false
		novapos = 7
		atributos_fase_singleton.setar_posicao(novapos)


func _ready():
	novapos = atributos_fase_singleton.mudarposicao
	atributos_fase_singleton.fase_restart = 2 
	atributos_fase_singleton.cont_enemie = 20
	atributos_fase_singleton.enemie_limit_in_game = 0
	
	if novapos == 0:
		$player_plataforma.position = $posicao_0.global_position
	if novapos == 1:
		$player_top_down.position = $pos_inicio_cena2.global_position
	if novapos == 2:
		$player_top_down.position = $pos_inicio_cena3.global_position
	if novapos == 3:
		$player_top_down.position = $pos_retorno_cena2.global_position
	if novapos == 4:
		$player_SD_F2.position = $pos_inicio_cena4.global_position
	if novapos == 5:
		$player_top_down.position = $pos_retorno_cena4.global_position
	if novapos == 6:
		$player_SD_F2.position = $position_inicio_cena5.global_position
	if novapos == 7 :
		$player_top_down.position = $pos_retorno_da_cena_5.global_position
	
func _physics_process(delta):
	
	
	if entrou_na_area1 == true and atributos_fase_singleton.in_area_perspective == true:
		if Input.is_action_pressed("ui_accept"):
			get_tree().change_scene("res://fases/fase_2/world_2_cena_2.tscn")
		
	elif entrou_na_area2 == true :
		get_tree().change_scene("res://fases/fase_2/world_2_cena_3.tscn")
		
	elif entrou_na_area3 == true :
		get_tree().change_scene("res://fases/fase_2/world_2_cena_2.tscn")
			
	elif entrou_na_area4 == true && Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://fases/fase_2/world_2_cena_4.tscn")
		
	elif entrou_na_area5 == true and atributos_fase_singleton.in_area_perspective == true:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene("res://fases/fase_2/world_2_cena_3.tscn")
		
	elif entrou_na_area6 == true and atributos_fase_singleton.in_area_perspective == true:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene("res://fases/fase_2/world_2_cena_5.tscn")
		
	elif entrou_na_area7 == true:
		if Input.is_action_just_pressed("ui_accept") and atributos_fase_singleton.in_area_perspective == true:
			get_tree().change_scene("res://fases/fase_2/world_2_cena_3.tscn")
















