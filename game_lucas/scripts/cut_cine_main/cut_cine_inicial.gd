extends Node2D

func _ready():
	Input.set_custom_mouse_cursor(load("res://assets_game/mouseempty.png"))

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "walk_animation":
		get_tree().change_scene("res://fases/fase_1/world_1_cena_1.tscn")
