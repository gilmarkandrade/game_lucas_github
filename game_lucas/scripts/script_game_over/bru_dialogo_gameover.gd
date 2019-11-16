extends AnimatedSprite

var dialog_selected = 0
var cont_death = false
var random_dialog = RandomNumberGenerator.new()
var cont_death_player = atributos_player_singleton.death_number
var dialog_primary = atributos_player_singleton.diag_bru_gameover
func _ready():
	cont_death_player = atributos_player_singleton.death_number
	dialog_primary = atributos_player_singleton.diag_bru_gameover
	if atributos_fase_singleton.anim_tutor_cena_1 == false:
		$".".visible = false
	elif atributos_fase_singleton.anim_tutor_cena_1 == true:
		$".".visible = true
	if dialog_primary == false:
		$falas_bru.text = "se considere com sorte, decidi ajudar você só porque achei você fofo HAHA le mandarei de volta para o ultimo portal gatinho"
		atributos_player_singleton.diag_bru_gameover = true
	elif dialog_primary == true:
		select_ramdon_dialogue()
		speech_bru()


func select_ramdon_dialogue():
	random_dialog. randomize()
	var random_speech = random_dialog. randi_range(1,10)
	dialog_selected = random_speech
		
func speech_bru():
	
	if dialog_selected ==1:
		$falas_bru.text = " denovo aqui, pensei que você fosse melhor que isso!"
	elif dialog_selected == 2 :
		$falas_bru.text = " só para eu nao ser a tia do contra e você me dizer que sou pessista, vai la voce consegue heroi"
	elif dialog_selected == 3 :
		$falas_bru.text = " e la vem o grande heroi haha serio isso !"
	elif dialog_selected == 4 :
		$falas_bru.text = " false sério, você só vem aqui para me ver né, que pena sou demais para você, mas até que eu ... hihihi..."
	elif dialog_selected == 5:
		$falas_bru.text = " eu nao preciso falar que se você fosse bom eu não estaria te vendo tão cedo né hahah!"
	elif dialog_selected == 6:
		$falas_bru.text = " ja vi em mil anos muita gente derrotada mas você é o mestre nesta arte! "
	elif dialog_selected == 7:
		$falas_bru.text = "  HA HA HA acho que o Caos esta tomando chá assistindo suas pateticas derrotas."
	elif dialog_selected == 8:
		$falas_bru.text =" você sabe a definição de insanidade não! não é isso que você esta pensando insanidade é morrer da forma tosca que voce morreu hahah!"
	elif dialog_selected == 9 :
		$falas_bru.text = " o Bom filho a casa torna haha Desse jeito você nunca vai conseguir me consquistar garotão HA HA HA."
	elif dialog_selected ==10:
		$falas_bru.text = "Fazendo as contas aqui notei que ja te salvei " 