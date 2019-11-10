extends Node
var enemie= preload("res://inimigos/inimigos_comun/fase_3/soldado_2_guerra/top_down/soldado_2_guerra_TD.tscn")
# limite de inimigo vivo na cena
var limit_enemie = atributos_fase_singleton.enemie_limit_in_game 
var stop_create = atributos_fase_singleton.stop_spawn_enemie

func _ready():
	# quantidade de inimigo que sera spawnada
	atributos_fase_singleton.cont_enemie = 15
	
	
func _on_area_test_cajado_body_entered(body):
	atributos_fase_singleton.weapon_away_status(true)
	$area_test_cajado.queue_free()

func spaw_enemie():
	var ARQ = enemie.instance()
	get_parent().add_child(ARQ)
	
	

func _on_delay_spawn_enemie_timeout():
	# o limit enemie é o maximo de inimigo que pode estar vivo na cena conforme vai morrendo ele vai permitindo spawn  de outros
	# e sempre vai tirando um do cont enemie que esta no singleton da fase quando o valor maximo da fase for atingido o
	#stop apawn enemie ficara true e passamos este parametro para uma variavel local dentro do script como esta abaixo no stop create
	# desta forma bloqueando a criaçao de qualquer inimigo na cena
	stop_create = atributos_fase_singleton.stop_spawn_enemie
	if limit_enemie <= 5 and stop_create == false:
		 spaw_enemie()
		
