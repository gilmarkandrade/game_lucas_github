extends Area2D
var number_speech = 0
func _ready():
	if atributos_fase_singleton.open_portal_init_fase == false:
		$"../animation_cut_cine_cena1".play("animation_portal_closed")
		atributos_fase_singleton.open_portal_init_fase = true
	$Panel/falas_bru. visible = false
	$Panel.visible = false
	$Panel/press_q.visible = false
	$Label.visible = false
	if atributos_fase_singleton .homen_das_cavernas_dead == true:
		$"../homen_das_cavernas(s_d)".queue_free()
	
	if atributos_fase_singleton.anim_tutor_cena_1 == false:
		$"../icone_mudar_perspectiva".visible = false
		atributos_player_singleton.stop_movement_player(true)
		$"../player_plataforma".visible = false
		
	dialogue_tutor_1()

func _on_area_fim_cena1_body_entered(body):
	pass 

func _process(delta):
	if Input.is_action_just_pressed("ui_interact") and $Panel/falas_bru.visible == true:
		number_speech +=1
		dialogue_tutor_1()
		if number_speech > 7:
			$Panel.visible = false
			$Panel/falas_bru.visible = false
			$Panel/press_q.visible = false
			$"../animation_cut_cine_cena1".play("animation_bru_exitcena")

func dialogue_tutor_1():
	if number_speech == 0 :
		$Panel/falas_bru.text = "Ola aventureiro!"
	elif number_speech == 1 :
		$Panel/falas_bru.text = " Pode me chamar de Bru, você deve estar confuso não é ?. "
	elif number_speech == 2 :
		$Panel/falas_bru.text = " Infelizmente você é mais uma vitima do CAOS ele é um mago com poderes capaz de atravessar a linha do tempo e espaço "
	elif number_speech == 3 :
		$Panel/falas_bru.text = " Você deve alcançalo e derrota lo caso queira retorna ao seu tempo"
	elif number_speech == 4:
		$Panel/falas_bru.text ="  ha! assim ja iria me esquecer HA HA HA!, você esta com um problema e nao consegue seguir adiante voce tera que fazer melhor que isso se quiser realmente vencer o Caos"
	elif number_speech == 5:
		$Panel/falas_bru.text = "Olhe por outra perspectiva abra sua mente e conseguira sempre, achar uma saida! "
	elif number_speech == 6 :
		$Panel/falas_bru.text = "Bem não entendeu ainda? então irei ajudalo toda vez que surgir este simbolo isto quer dizer que voce podera trocar a perspectiva que você enxerga isto abrira outros caminhos"
		$"../icone_mudar_perspectiva".visible = true
	elif number_speech == 7 :
		$Panel/falas_bru.text = " Corra aventureiro as areias do tempo ja estão caindo"

func _on_area_fim_cena1_body_exited(body):
	if body.is_in_group("player"):
		if atributos_fase_singleton.anim_tutor_cena_1 == false and atributos_fase_singleton.homen_das_cavernas_dead == true:
			$"../animation_cut_cine_cena1".play("animation_bru _surgindo")
			atributos_player_singleton.stop_movement_player(true)
			$"../animation_cut_cine_cena1/Bru".visible = true
	
		
func _on_animation_cut_cine_cena1_animation_finished(anim_name):
	if anim_name == "animation_bru_exitcena":
		atributos_player_singleton.stop_movement_player(false)
		atributos_player_singleton.stop_movement_player(false)
		atributos_fase_singleton.tutorial_1_cena_1(true)
		$"../animation_cut_cine_cena1/Bru".visible = false
	
	elif anim_name =="animation_portal_closed":
		$"../player_plataforma".visible = true
		atributos_player_singleton.stop_movement_player(false)
	
	elif anim_name == "animation_bru _surgindo":
		$"../animation_cut_cine_cena1".play("animation_fly_bru")
		$Panel/falas_bru. visible = true
		$Panel.visible = true
		$Panel/press_q.visible = true


func _on_icone_mudar_perspectiva_body_entered(body):
	if body.is_in_group("player") and atributos_fase_singleton.anim_tutor_cena_1 == true:
		$Label.visible = true


func _on_icone_mudar_perspectiva_body_exited(body):
	if body.is_in_group("player"):
		$Label.visible = false

#======================= area label jump =================================
func _on_area_tutorial_jump_body_entered(body):
	if body.is_in_group("player"):
		$area_tutorial_jump/Panel.visible = true
		$area_tutorial_jump/Panel/Label.visible = true



func _on_area_tutorial_jump_body_exited(body):
	if body.is_in_group("player"):
		$area_tutorial_jump/Panel.visible = false
		$area_tutorial_jump/Panel/Label.visible = false

#============================area label atack ===============================
func _on_area_tutorial_ataque_body_entered(body):
	if body.is_in_group("player"):
		$area_tutorial_ataque/Panel2.visible = true
		$area_tutorial_ataque/Panel2/Label.visible =  true


func _on_area_tutorial_ataque_body_exited(body):
	if body.is_in_group("player"):
		$area_tutorial_ataque/Panel2.visible = false
		$area_tutorial_ataque/Panel2/Label.visible =  false
