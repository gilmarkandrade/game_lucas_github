extends Node
var portal_open = atributos_fase_singleton.open_portal_init_fase



func _ready():
	if portal_open == false:
		atributos_fase_singleton.open_portal_init_fase = true
		$animation_portal.play("open_portal")
		$"../player_top_down_F3".visible = false
		atributos_player_singleton.stop_movement_player(true)
		

func _on_animation_portal_animation_finished(anim_name):
	if anim_name == "open_portal":
		$"../player_top_down_F3".visible = true
		atributos_player_singleton.stop_movement_player(false)
		$animation_portal.play_backwards("close_portal")
