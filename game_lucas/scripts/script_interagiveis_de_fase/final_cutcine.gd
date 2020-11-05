extends Node2D

func _ready():
	Input.set_custom_mouse_cursor(load("res://assets_game/mouseempty.png"))

func _on_AnimationSilvia_animation_finished(anim_name):
	if anim_name == "primeira_animation":
		get_tree().change_scene("res://cenas_globais/Menu_Inicial/menu_inicial.tscn")
