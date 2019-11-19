extends Area2D

var enemie_arqueiro = preload("res://inimigos/inimigos_comun/fase_2/arqueiro/top_down/arqueiro(T_D).tscn")
var enemie_cavaleiro = preload("res://inimigos/inimigos_comun/fase_2/cavaleiro_espada/top_down/cavaleiro_espada(T_D).tscn")
var RNG = RandomNumberGenerator.new()
# limite de inimigo vivo na cena
var limit_enemie = atributos_fase_singleton.enemie_limit_in_game 
var stop_create = atributos_fase_singleton.stop_spawn_enemie
var enemie_selected = 0



func _ready():
	# quantidade de inimigo que sera spawnada
	atributos_fase_singleton.cont_enemie = 25
	atributos_fase_singleton.stop_spawn_enemie = false
	


func select_ramdon_enemie():
	RNG . randomize()
	var random_enemie = RNG. randi_range(1,2)
	enemie_selected = random_enemie



func spaw_enemie():
	select_ramdon_enemie()
	if enemie_selected == 1 :
		var ARQ = enemie_arqueiro.instance()
		get_parent().add_child(ARQ)
		ARQ.scale.x = 0.6
		ARQ.scale.y = 0.6
		ARQ.position = $position_inimigo_1.global_position
	if enemie_selected == 2 :
		var CAV = enemie_cavaleiro.instance()
		get_parent().add_child(CAV)
		CAV.scale.x = 0.6 
		CAV.scale.y = 0.6
		CAV.position = $position_inimigo_2.global_position
	

func _on_delay_spawn_enemie_timeout():
	# o limit enemie é o maximo de inimigo que pode estar vivo na cena conforme vai morrendo ele vai permitindo spawn  de outros
	# e sempre vai tirando um do cont enemie que esta no singleton da fase quando o valor maximo da fase for atingido o
	#stop apawn enemie ficara true e passamos este parametro para uma variavel local dentro do script como esta abaixo no stop create
	# desta forma bloqueando a criaçao de qualquer inimigo na cena
	stop_create = atributos_fase_singleton.stop_spawn_enemie
	limit_enemie = atributos_fase_singleton.enemie_limit_in_game 
	if limit_enemie <= 5 and stop_create == false and atributos_fase_singleton.anim_close_door_finalized <= 2 :
		spaw_enemie()
		$som_trilha.volume_db = -1
		$som_trilha.pitch_scale = 1.3
		print(limit_enemie ,stop_create,atributos_fase_singleton.anim_close_door_finalized,atributos_fase_singleton.cont_enemie )
	if atributos_fase_singleton.anim_close_door_finalized == 1:
		$animation_dor.current_animation = "close_the_door"
		
	elif atributos_fase_singleton.stop_spawn_enemie == true and atributos_fase_singleton.anim_close_door_finalized == 2 and limit_enemie <=0 :
		
		$animation_dor.current_animation = "open_the_door"
		atributos_fase_singleton.animation_door_finalized(1)
		$som_trilha.volume_db = -10
		$som_trilha.pitch_scale = 1
		print(limit_enemie ,stop_create,atributos_fase_singleton.anim_close_door_finalized,atributos_fase_singleton.cont_enemie )
func _on_area_criar_inimigos_body_entered(body):
	if body.is_in_group("player"):
		$delay_spawn_enemie.start()
		atributos_fase_singleton.animation_door_finalized(1)
		
func _on_animation_dor_animation_finished(anim_name):
	if anim_name == "close_the_door":
		atributos_fase_singleton.anim_close_door_finalized = 2
