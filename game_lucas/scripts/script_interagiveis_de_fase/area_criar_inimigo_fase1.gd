extends Area2D
var enemie= preload("res://inimigos/inimigos_comun/fase_1/homem_das_cavernas/top_down/homen_das_cavernas(T_D).tscn")
var RNG = RandomNumberGenerator.new()
# limite de inimigo vivo na cena
var limit_enemie = atributos_fase_singleton.enemie_limit_in_game 
var stop_create = atributos_fase_singleton.stop_spawn_enemie
var enemie_selected = 0

func _ready():
	# quantidade de inimigo que sera spawnada
	atributos_fase_singleton.cont_enemie = 15
	



func select_ramdon_enemie():
	RNG . randomize()
	var random_enemie = RNG. randi_range(1,3)
	enemie_selected = random_enemie



func spaw_enemie():
	select_ramdon_enemie()
	var h_C = enemie.instance()
	get_parent().add_child(h_C)
	h_C.scale.x = 0.6
	h_C.scale.y = 0.6
	if enemie_selected == 1 :
		h_C.position = $position_inimigo_1.global_position
	if enemie_selected == 2 :
		h_C.position = $position_inimigo_2.global_position
	if enemie_selected == 3 :
		h_C.position = $position_inimigo_3.global_position
	

func _on_delay_spawn_enemie_timeout():
	# o limit enemie é o maximo de inimigo que pode estar vivo na cena conforme vai morrendo ele vai permitindo spawn  de outros
	# e sempre vai tirando um do cont enemie que esta no singleton da fase quando o valor maximo da fase for atingido o
	#stop apawn enemie ficara true e passamos este parametro para uma variavel local dentro do script como esta abaixo no stop create
	# desta forma bloqueando a criaçao de qualquer inimigo na cena
	stop_create = atributos_fase_singleton.stop_spawn_enemie
	limit_enemie = atributos_fase_singleton.enemie_limit_in_game 
	if limit_enemie <= 3 and stop_create == false:
		spaw_enemie()
	
	
func _on_area_criar_inimigo_fase1_body_entered(body):
	if body.is_in_group("player"):
		$delay_spawn_enemie.start()
		


	
