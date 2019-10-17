extends Node

var novapos
var entrou_na_area1 = false
var entrou_na_area2 = false
var entrou_na_area3 = false
var entrou_na_area4 = false



func _on_entrar_cena2_body_entered(body):
	if body.name == "player_plataforma":
		entrou_na_area2 = true
		entrou_na_area1 = false
		novapos = 2
		atributos_fase_singleton.setar_posicao(novapos)
	pass

func _on_entrar_direto_cena3_body_entered(body):
	if body.name == "player_top_down":
		entrou_na_area3 = true
		entrou_na_area2 = false
		novapos = 3
		atributos_fase_singleton.setar_posicao(novapos)
	pass 

func _on_retorno_direto_cena2_body_entered(body):
	if body.name == "player_top_down":
		entrou_na_area2 = true
		entrou_na_area3 = false
		novapos = -2
		atributos_fase_singleton.setar_posicao(novapos)
	pass

func _on_entrar_direto_cena4_body_entered(body):
	if body.name == "player_top_down":
		entrou_na_area4 = true
		entrou_na_area3 = false
		novapos = 4
		atributos_fase_singleton.setar_posicao(novapos)
	pass

func _on_retorno_direto_cena3_body_entered(body):
	if body.name == "player_plataforma":
		entrou_na_area3 = true
		entrou_na_area4 = false
		novapos = -3
		atributos_fase_singleton.setar_posicao(novapos)
	pass


func _ready():
	novapos = atributos_fase_singleton.mudarposicao 
	
	#if novapos == 1:
	#	$player_plataforma.position = $Position2D.global_position
	if novapos == 2:
		$player_top_down.position = $pos_inicio_cena2.global_position
	if novapos == 3:
		$player_top_down.position = $pos_inicio_cena3.global_position
	if novapos == -2:
		$player_top_down.position = $pos_retorno_cena2.global_position
	if novapos == 4:
		$player_plataforma.position = $pos_inicio_cena4.global_position
	if novapos == -3:
		$player_top_down.position = $pos_retorno_cena4.global_position
	
	pass
	
func _physics_process(delta):
	
	if entrou_na_area2 == true:
		if novapos == -2:
			get_tree().change_scene("res://fases/fase_2/world_2_cena_2.tscn")
		elif Input.is_action_pressed("ui_accept"):
			get_tree().change_scene("res://fases/fase_2/world_2_cena_2.tscn")
	if entrou_na_area3 == true:
		get_tree().change_scene("res://fases/fase_2/world_2_cena_3.tscn")
	if entrou_na_area4 == true:
		get_tree().change_scene("res://fases/fase_2/world_2_cena_4.tscn")
	
	pass
