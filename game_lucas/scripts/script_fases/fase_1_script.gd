extends Node
var entrou_na_area = false

var novapos
var entrou_na_area2 = false
var entrou_na_area3 = false
var entrou_na_area4 = false
var entrou_na_area5 = false
var entrou_na_area6 = false




func _ready():
	novapos = atributos_fase_singleton.mudarposicao 

	
	if novapos == 1:
		$player_plataforma.position = $Position2D.global_position
	if novapos == 2:
		$player_top_down.position = $position_arvore.global_position
	if novapos  == 3 :
		$player_top_down.position = $position_inicio_cena3.global_position
	if novapos == 4 :
		$player_top_down.position = $position_fimcena2.global_position
	if novapos == 5:
		$player_plataforma.position = $position_inicio_cena4.global_position
	if novapos == 6 :
		$player_top_down.position= $position_fim_cena3.global_position



		
func _on_Area2D_body_entered(body):
	if body.name == "player_plataforma":
		entrou_na_area = true
		novapos = 2
		atributos_fase_singleton.setar_posicao(novapos)
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
	
	if entrou_na_area5 == true:
		if Input.is_action_pressed("ui_accept"):
			get_tree().change_scene("res://fases/fase_1/world_1_cena_4.tscn")
	if entrou_na_area6 == true:
		if Input.is_action_pressed("ui_accept"):
			get_tree().change_scene("res://fases/fase_1/world_1_cena_3.tscn")

	
	
func _on_area_iniciocena2_body_entered(body):
	if body.name == "player_top_down":
		entrou_na_area2 = true
		novapos = 1
		print(novapos)
		atributos_fase_singleton.setar_posicao(novapos)
		$Label.visible = true


func _on_area_iniciocena2_body_exited(body):
	if body.name == "player_top_down":
		entrou_na_area2 = false
		atributos_fase_singleton.setar_posicao(novapos)
		$Label.visible = false


func _on_area_mudar_cena3_body_entered(body):
	if body.is_in_group("player"):
		entrou_na_area3 = true
		entrou_na_area4 = false
		novapos = 3
		atributos_fase_singleton.setar_posicao(novapos)
		
		

func _on_area_inicio_cena3_body_entered(body):
	if body.is_in_group("player"):
		entrou_na_area4 = true 
		entrou_na_area3 = false
		novapos = 4 
		atributos_fase_singleton.setar_posicao(novapos) 

func _on_area_fim_cena_3_body_entered(body):
	if body.is_in_group("player"):
		entrou_na_area5 = true 
		entrou_na_area4 = false
		novapos = 5
		atributos_fase_singleton.setar_posicao(novapos) 
	


func _on_area_inicio_cena_4_body_entered(body):
	if body.is_in_group("player"):
		entrou_na_area6 = true 
		entrou_na_area5 = false
		novapos = 6
		atributos_fase_singleton.setar_posicao(novapos)

#portal  fase 2 
func _on_portal_fase_2_body_entered(body):
	if body. is_in_group("player"):
		$player_plataforma._physics_process(false)
		$player_plataforma.visible = false
		$portal_fase_2/animation_portal . play("portal_close")

# animação arvore

func _on_animaton_tree_animation_finished(anim_name):
	if anim_name == "falling_down_tree":
		$portal_fase_2/animation_portal. play("portal_open")
	
#animação portal

func _on_animation_portal_animation_finished(anim_name):
	if anim_name == "portal_close":
		get_tree().change_scene("res://fases/fase_2/world_2_cena_1.tscn")
