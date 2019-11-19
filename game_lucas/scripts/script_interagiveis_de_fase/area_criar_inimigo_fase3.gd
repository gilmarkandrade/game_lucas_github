extends Area2D

var enemie_SL = preload("res://inimigos/inimigos_comun/fase_3/soldado_2_guerra/top_down/soldado_2_guerra_TD.tscn")

var RNG = RandomNumberGenerator.new()
# limite de inimigo vivo na cena
var limit_enemie = atributos_fase_singleton.enemie_limit_in_game 
var stop_create = atributos_fase_singleton.stop_spawn_enemie
var enemie_selected = 0
var position_enemie
var camera_zoom_action = false
var portal_open = false

func _ready():
	# quantidade de inimigo que sera spawnada
	atributos_fase_singleton.cont_enemie = 40
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
	


func spaw_enemie():
	select_position_ramdon()
	
	var S_L = enemie_SL.instance()
	get_parent().add_child(S_L)
	S_L.scale.x = 1.3
	S_L.scale.y = 1.3
	S_L.position = position_enemie
	
	

func _on_delay_spawn_enemie_timeout():
	# o limit enemie é o maximo de inimigo que pode estar vivo na cena conforme vai morrendo ele vai permitindo spawn  de outros
	# e sempre vai tirando um do cont enemie que esta no singleton da fase quando o valor maximo da fase for atingido o
	#stop apawn enemie ficara true e passamos este parametro para uma variavel local dentro do script como esta abaixo no stop create
	# desta forma bloqueando a criaçao de qualquer inimigo na cena
	stop_create = atributos_fase_singleton.stop_spawn_enemie
	limit_enemie = atributos_fase_singleton.enemie_limit_in_game 
	
	if limit_enemie <= 4 and stop_create == false:
		spaw_enemie()
		print(atributos_fase_singleton.cont_enemie)
	elif limit_enemie <= 0 and stop_create == true and portal_open == false:
		$animation_camera.play("open_portal")
		portal_open = true
func _on_area_criar_inimigo_fase3_body_entered(body):
	if body.is_in_group("player"):
		$delay_spawn_enemie.start()
		if camera_zoom_action == false:
			$animation_camera.play("zoom_camera")
			camera_zoom_action = true
			$som_ambiente2.play()


func _on_area_portal_body_entered(body):
	if body.is_in_group("player"):
		atributos_player_singleton.stop_movement_player(true)
		$"../player_top_down_F3".visible = false
		$animation_camera.play_backwards("close_portal")
	

func _on_animation_camera_animation_finished(anim_name):
	if anim_name == "close_portal":
		get_tree().change_scene("res://fases/fase_4/world_4_cena_1.tscn")
