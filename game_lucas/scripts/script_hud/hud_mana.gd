extends Control
var mana_activate = atributos_fase_singleton.get_weapom_away
# recebe o valor de verdadeiro ou falso caso do game singleton e defini a visibilidade 
# da barra de mana

func _process(delta):
	update_valuer_mana_hud()
	update_visiblity_bar()
	

	

func update_valuer_mana_hud():

	$hud_bar.value = atributos_player_singleton.mana_player
	
func update_visiblity_bar():
	mana_activate = atributos_fase_singleton.get_weapom_away
	if mana_activate == false:
		$hud_bar.visible = false
	elif mana_activate == true:
		$hud_bar.visible = true