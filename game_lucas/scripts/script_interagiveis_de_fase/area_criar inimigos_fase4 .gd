extends Area2D


var enemie_MB = preload("res://inimigos/inimigos_comun/fase_4/mafioso_bruto/mafioso_bruto.tscn")
var enemie_MA = preload("res://inimigos/inimigos_comun/fase_4/mafioso_armado/mafioso_armado.tscn")
var RNG = RandomNumberGenerator.new()
# limite de inimigo vivo na cena
var limit_enemie = atributos_fase_singleton.enemie_limit_in_game 
var stop_create = atributos_fase_singleton.stop_spawn_enemie
var enemie_selected = 0
var position_enemie
var portal_create = false
var close_the_door = false
func _ready():
	# quantidade de inimigo que sera spawnada
	atributos_fase_singleton.cont_enemie = 50
	atributos_fase_singleton.stop_spawn_enemie = false


func select_position_ramdon():
	RNG.randomize()
	var position_random = RNG. randi_range(1,4)
	
	if position_random == 1:
		position_enemie = $position_inimigo1.global_position
	elif position_random == 2:
		position_enemie = $position_inimigo2.global_position
	elif position_random == 3 :
		position_enemie = $position_inimigo3.global_position
	elif position_random == 4 :
		position_enemie = $position_inimigo4 .global_position
	
func select_ramdon_enemie():
	RNG . randomize()
	var random_enemie = RNG. randi_range(1,2)
	enemie_selected = random_enemie



func spaw_enemie():
	select_position_ramdon()
	select_ramdon_enemie()
	if enemie_selected == 1 :
		var M_B = enemie_MB.instance()
		get_parent().add_child(M_B)
		M_B.scale.x = 1.3
		M_B.scale.y = 1.3
		M_B.position = position_enemie
	if enemie_selected == 2 :
		var M_A = enemie_MA.instance()
		get_parent().add_child(M_A)
		M_A.scale.x = 1 
		M_A.scale.y = 1
		M_A.position = position_enemie
	

func _on_delay_spawn_enemie_timeout():
	# o limit enemie é o maximo de inimigo que pode estar vivo na cena conforme vai morrendo ele vai permitindo spawn  de outros
	# e sempre vai tirando um do cont enemie que esta no singleton da fase quando o valor maximo da fase for atingido o
	#stop apawn enemie ficara true e passamos este parametro para uma variavel local dentro do script como esta abaixo no stop create
	# desta forma bloqueando a criaçao de qualquer inimigo na cena
	stop_create = atributos_fase_singleton.stop_spawn_enemie
	limit_enemie = atributos_fase_singleton.enemie_limit_in_game 
	if close_the_door == false  :
		$animation_door.play("door_1_close")
		close_the_door = true  
	if limit_enemie <= 5 and stop_create == false:
		spaw_enemie()
		
	if stop_create == true  and portal_create == false and limit_enemie <= 0:
		
		portal_create = true
		$animation_door.play("open_portal")
		
func _on_area_criar_inimigos_fase4_body_entered(body):
	if body.is_in_group("player"):
		$delay_spawn_enemie.start()
				





func _on_portal_area_body_entered(body):
	if body.is_in_group("player"):
		atributos_fase_singleton.open_portal_init_fase = false
		$animation_door.play_backwards("close_portal")
	


func _on_animation_door_animation_finished(anim_name):
	
	if anim_name == "close_portal":
	
		get_tree().change_scene("res://fases/fase_5/world_5_cena_1.tscn")
