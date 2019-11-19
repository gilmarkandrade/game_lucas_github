extends Node2D



func _on_AnimationSilvia_animation_finished(anim_name):
	if anim_name== "primeira_animation":
		get_tree().change_scene("res://cenas_globais/Menu_Inicial/menu_inicial.tscn")
