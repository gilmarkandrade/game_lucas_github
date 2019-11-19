extends Node2D

#var plataforma = preload("res://fases/plataforma_final_boss.tscn")
#var chao = preload("res://fases/chao_final_boss_cena_1.tscn")
var oi = preload("res://fases/teste_gerar2.tscn")

func _on_ativa_spaw_body_entered(area):
	if area.is_in_group("player"):
		var G = oi.instance()
		$".".add_child(G)
		G.position = $chao_spawn.global_position
		
		#var P1 = plataforma.instance()
		#get_parent().add_child(P1)
		#P1.position = $plataforma_spawn1.global_position
		
		#var P2 = plataforma.instance()
		#get_parent().add_child(P2)
		#P2.position = $plataforma_spawn2.global_position
	
	pass