extends Node

func _ready():
	if atributos_fase_singleton.open_portal_init_fase == false:
		$animation_portal.play("open_portal")
		$"../player_top_down_F4".visible = false
		atributos_player_singleton.stop_movement_player(true)
		

func _on_animation_portal_animation_finished(anim_name):
	if anim_name == "open_portal" :
		$animation_portal.play_backwards("close_portal")
		$"../player_top_down_F4".visible = true
		atributos_player_singleton.stop_movement_player(false)
