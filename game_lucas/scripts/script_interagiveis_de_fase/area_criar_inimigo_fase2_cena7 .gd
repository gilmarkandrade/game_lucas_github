extends Area2D
var enemie_arqueiro = preload("res://inimigos/inimigos_comun/fase_2/arqueiro/top_down/arqueiro(T_D).tscn")
var enemie_cavaleiro = preload("res://inimigos/inimigos_comun/fase_2/cavaleiro_espada/top_down/cavaleiro_espada(T_D).tscn")
var RNG = RandomNumberGenerator.new()
# limite de inimigo vivo na cena
var limit_enemie = atributos_fase_singleton.enemie_limit_in_game 
var stop_create = atributos_fase_singleton.stop_spawn_enemie
var enemie_selected = 0
var position_enemie
var portal_create = false

func _ready():
	# quantidade de inimigo que sera spawnada
	atributos_fase_singleton.cont_enemie = 35
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
		var ARQ = enemie_arqueiro.instance()
		get_parent().add_child(ARQ)
		ARQ.scale.x = 0.8
		ARQ.scale.y = 0.8
		ARQ.position = position_enemie
	if enemie_selected == 2 :
		var CAV = enemie_cavaleiro.instance()
		get_parent().add_child(CAV)
		CAV.scale.x = 0.8 
		CAV.scale.y = 0.8
		CAV.position = position_enemie
	

func _on_delay_spawn_enemie_timeout():
	# o limit enemie é o maximo de inimigo que pode estar vivo na cena conforme vai morrendo ele vai permitindo spawn  de outros
	# e sempre vai tirando um do cont enemie que esta no singleton da fase quando o valor maximo da fase for atingido o
	#stop apawn enemie ficara true e passamos este parametro para uma variavel local dentro do script como esta abaixo no stop create
	# desta forma bloqueando a criaçao de qualquer inimigo na cena
	stop_create = atributos_fase_singleton.stop_spawn_enemie
	limit_enemie = atributos_fase_singleton.enemie_limit_in_game 
	if limit_enemie <= 5 and stop_create == false:
		spaw_enemie()
		$som_trilha.volume_db = -1
		$som_trilha.pitch_scale = 1.3
	
	if stop_create == true  and portal_create == false and limit_enemie <= 0:
		$animation_camera.play("open_portal")
		portal_create = true
		$som_trilha.volume_db = -10
		$som_trilha.pitch_scale = 1
	
func _on_area_criar_inimigo_fase2_cena7__body_entered(body):
	if body.is_in_group("player"):
		$delay_spawn_enemie.start()
		$animation_camera.play("camera_zoom")
		







func _on_area_portal_body_entered(body):
	if body.is_in_group("player"):
		$"../player_top_down_F2".visible = false
		atributos_player_singleton.stop_movement_player(true)
		$animation_camera.play_backwards("close_portal")


func _on_animation_camera_animation_finished(anim_name):
	if anim_name == "close_portal":
		atributos_player_singleton.stop_movement_player(false)
		get_tree().change_scene("res://fases/fase_3/world_3_cena_1.tscn")
