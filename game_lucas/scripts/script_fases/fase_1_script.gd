extends Node
var entrou_na_area = false

var novapos
var entrou_na_area2 = false
var entrou_na_area3 = false
var entrou_na_area4 = false




func _ready():
	novapos = singletonfase.mudarposicao 

	
	if novapos == 1:
		$player_plataforma.position = $Position2D.global_position
	if novapos == 2:
		$player_top_down.position = $position_arvore.global_position
	if novapos  == 3 :
		$player_top_down.position = $position_inicio_cena3.global_position
	if novapos == 4 :
		$player_top_down.position = $position_fimcena3.global_position
		
func _on_Area2D_body_entered(body):
	if body.name == "player_plataforma":
		entrou_na_area = true
		novapos = 2
		singletonfase.setar_posicao(novapos)
		$Label.visible = true



func _on_Area2D_body_exited(body):
	if body.name == "player_plataforma":
		entrou_na_area = false
		$Label.visible= false
		

func _physics_process(delta):
	
	if entrou_na_area == true:
		if Input.is_action_pressed("ui_accept"):
			get_tree().change_scene("res://fases/fase_1/world_1_cena_2.tscn")
	
	if entrou_na_area2 == true:
		if Input.is_action_pressed("ui_accept"):
				get_tree().change_scene("res://fases/fase_1/world_1_cena_1.tscn")
	
	if entrou_na_area3 == true :
		get_tree().change_scene("res://fases/fase_1/world_1_cena_3.tscn")
	
	if entrou_na_area4 == true:
		get_tree().change_scene("res://fases/fase_1/world_1_cena_2.tscn")
	
	

	
	
func _on_area_iniciocena2_body_entered(body):
	if body.name == "player_top_down":
		entrou_na_area2 = true
		novapos = 1
		print(novapos)
		singletonfase.setar_posicao(novapos)
		$Label.visible = true


func _on_area_iniciocena2_body_exited(body):
	if body.name == "player_top_down":
		entrou_na_area2 = false
		singletonfase.setar_posicao(novapos)
		$Label.visible = false


func _on_area_mudar_cena3_body_entered(body):
	if body.is_in_group("player"):
		entrou_na_area3 = true
		entrou_na_area4 = false
		novapos = 3
		singletonfase.setar_posicao(novapos)
		
		

func _on_area_inicio_cena3_body_entered(body):
	if body.is_in_group("player"):
		entrou_na_area4 = true 
		entrou_na_area3 = false
		novapos = 4 
		singletonfase.setar_posicao(novapos) 