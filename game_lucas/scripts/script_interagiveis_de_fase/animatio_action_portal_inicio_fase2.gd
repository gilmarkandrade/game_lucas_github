extends Node


func _ready():
	if atributos_fase_singleton.open_portal_init_fase == false:
		atributos_fase_singleton.open_portal_init_fase =true
		atributos_player_singleton.stop_movement_player(true)
		$"../player_plataforma".visible = false
		$animation_portal.play("open_portal")
		
		

func _on_animation_portal_animation_finished(anim_name):
	if anim_name == "open_portal":
		atributos_player_singleton.stop_movement_player(false)
		$"../player_plataforma".visible = true
		$animation_portal.play_backwards("close_portal")