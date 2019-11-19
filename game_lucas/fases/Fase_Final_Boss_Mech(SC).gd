extends Node2D

var plataforma = preload("res://fases/plataforma_final_boss.tscn")
var chao = preload("res://fases/chao_final_boss_cena_1.tscn")

func _ready():
	atributos_fase_singleton.get_weapom_away = true

func _on_ativa_spaw_body_entered(area):
	if area.is_in_group("enemie"):
		var C = chao.instance()
		$".".add_child(C)
		C.position = $chao_spawn.global_position
	
		var P1 = plataforma.instance()
		$".".add_child(P1)
		P1.position = $plataforma_spawn1.global_position
		
		var P2 = plataforma.instance()
		$".".add_child(P2)
		P2.position = $plataforma_spawn2.global_position
		
		var P3 = plataforma.instance()
		$".".add_child(P3)
		P3.position = $plataforma_spawn3.global_position
	
	$ativa_spaw.position.x += 1080
	$chao_spawn.position.x += 1080
	$plataforma_spawn1.position.x += 1080
	$plataforma_spawn2.position.x += 1080
	$plataforma_spawn3.position.x += 1080
	pass