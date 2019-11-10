extends Control

func _ready():
	
	pass

func _on_Jogar_pressed():
	get_tree().change_scene("res://fases/fase_1/world_1_cena_1.tscn")
	pass

func _on_Sair_pressed():
	get_tree().quit()
	pass