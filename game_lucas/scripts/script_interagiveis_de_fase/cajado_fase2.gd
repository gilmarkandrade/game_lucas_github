extends Area2D
var get_cajado = atributos_fase_singleton.get_weapom_away
var number_speak = 0
var fimcutcine = false
var esta_na_area_cajado = false

func _ready(): 

	if atributos_fase_singleton.get_weapom_away == false:
		$animation_cajado.play("spawn_bru_animation")
		atributos_player_singleton.stop_movement_player(true)
		bru_talking()
		$icone_mudar_perspectiva.visible = false
	
	elif atributos_fase_singleton.get_weapom_away == true:
		fimcutcine = true
		$cajado_aura.visible = false
		$icone_mudar_perspectiva.visible = true

func _process(delta):
	
	
	if Input.is_action_just_pressed("ui_interact") and atributos_fase_singleton.get_weapom_away == false:
		if number_speak <= 3:
			number_speak +=1 
			bru_talking()
		elif number_speak >=3 and fimcutcine == false:
			fimcutcine = true
			$animation_cajado.play_backwards("bru_animation_finalized")
		
		elif esta_na_area_cajado == true  and atributos_fase_singleton.get_weapom_away == false:
			if Input.is_action_pressed("ui_interact"):
				atributos_fase_singleton.weapon_away_status(true)
				$cajado_aura.visible = false
				$particulacajado.emitting = true
				$icone_mudar_perspectiva.visible = true
		
func _on_animation_cajado_animation_finished(anim_name):
	if anim_name ==  "spawn_bru_animation":
		$fala_bru.visible = true
		$Panel.visible = true
		$Panel/Label.visible = true
		$animation_cajado.play("idle_animation")
	elif anim_name == "bru_animation_finalized":
		atributos_player_singleton.stop_movement_player(false)
		$fala_bru.visible = false
		$Panel.visible = false
		$Panel/Label.visible = false
	
func bru_talking():
	if number_speak== 0:
		$fala_bru.text = "ola aventureiro"
	elif number_speak == 1:
		$fala_bru.text = "deixei este cajado encantado para voce"
	elif number_speak == 2:
		$fala_bru.text = "esta uma das minhas armas sagradas, ela consegue comutar sua forma atraves das eras"
	elif number_speak == 3 :
		$fala_bru.text = "use a para vencer o caos e retorna ao seu tempo"
	elif number_speak == 4 :
		$fala_bru.text = "corra viajante o tempo esta contra você"

func _on_area_cajado_body_entered(body):

	if body.is_in_group("player") and atributos_fase_singleton.get_weapom_away == false :
		esta_na_area_cajado = true 
		$cajado_aura/Label2.visible = true
		


func _on_area_cajado_body_exited(body):
	if body.is_in_group("player") :
		esta_na_area_cajado = false
		$cajado_aura/Label2.visible = false
