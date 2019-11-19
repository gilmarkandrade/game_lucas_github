extends Node2D



func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "walk_animation":
		get_tree().change_scene("res://fases/fase_1/world_1_cena_1.tscn")
