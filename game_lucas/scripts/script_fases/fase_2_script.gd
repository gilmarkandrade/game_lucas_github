extends Node

var novapos
var entrou_na_area1 = false
var entrou_na_area2 = false




func _on_entrar_area2_body_entered(body):
	if body.name == "player_plataforma":
		entrou_na_area2 = true
		entrou_na_area1 = false
		novapos = 2
		atributos_fase_singleton.setar_posicao(novapos)
	pass 

func _ready():
	#novapos = atributos_fase_singleton.mudarposicao 
	
	pass
	
func _physics_process(delta):
	
	if entrou_na_area2 == true:
		if Input.is_action_pressed("ui_accept"):
			get_tree().change_scene("res://fases/fase_2/world_2_cena_2.tscn")
	
	pass
