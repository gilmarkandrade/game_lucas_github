extends AnimatedSprite

var dialog_selected = 0
var cont_death = false
var random_dialog = RandomNumberGenerator.new()
var cont_death_player = atributos_player_singleton.death_number
var dialog_primary = atributos_player_singleton.diag_bru_gameover

func _ready():
	cont_death_player = atributos_player_singleton.death_number
	dialog_primary = atributos_player_singleton.diag_bru_gameover
	Input.set_custom_mouse_cursor(null)
	if atributos_fase_singleton.anim_tutor_cena_1 == false:
		$".".visible = false
	
	elif atributos_fase_singleton.anim_tutor_cena_1 == true:
		$".".visible = true
	
	if dialog_primary == false:
		$falas_bru.text = "DIAG20"
		atributos_player_singleton.diag_bru_gameover = true
	
	elif dialog_primary == true:
		select_ramdon_dialogue()
		speech_bru()


func select_ramdon_dialogue():
	random_dialog. randomize()
	var random_speech = random_dialog. randi_range(1,10)
	dialog_selected = random_speech
		
func speech_bru():
	$falas_bru2.text = ""
	$falas_bru3.text = ""
	if dialog_selected ==1:
		$falas_bru.text = "DIAG9"
	elif dialog_selected == 2 :
		$falas_bru.text = "DIAG10"
	elif dialog_selected == 3 :
		$falas_bru.text = "DIAG11"
	elif dialog_selected == 4 :
		$falas_bru.text = "DIAG12"
	elif dialog_selected == 5:
		$falas_bru.text = "DIAG13"
	elif dialog_selected == 6:
		$falas_bru.text = "DIAG14"
	elif dialog_selected == 7:
		$falas_bru.text = "DIAG15"
	elif dialog_selected == 8:
		$falas_bru.text = "DIAG16"
	elif dialog_selected == 9 :
		$falas_bru.text = "DIAG17"
	elif dialog_selected ==10:
		$falas_bru.text = "DIAG18" 
		$falas_bru2.text = str(atributos_player_singleton.death_number)
		$falas_bru3.text = "DIAG19"
